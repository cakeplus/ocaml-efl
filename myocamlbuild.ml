(* OASIS_START *)
(* DO NOT EDIT (digest: 9fdfcbbdbef17f7af5048183c9476b25) *)
module OASISGettext = struct
# 21 "/home/axiles/src/oasis-0.3.0/src/oasis/OASISGettext.ml"

  let ns_ str =
    str

  let s_ str =
    str

  let f_ (str : ('a, 'b, 'c, 'd) format4) =
    str

  let fn_ fmt1 fmt2 n =
    if n = 1 then
      fmt1^^""
    else
      fmt2^^""

  let init =
    []

end

module OASISExpr = struct
# 21 "/home/axiles/src/oasis-0.3.0/src/oasis/OASISExpr.ml"



  open OASISGettext

  type test = string 

  type flag = string 

  type t =
    | EBool of bool
    | ENot of t
    | EAnd of t * t
    | EOr of t * t
    | EFlag of flag
    | ETest of test * string
    

  type 'a choices = (t * 'a) list 

  let eval var_get t =
    let rec eval' =
      function
        | EBool b ->
            b

        | ENot e ->
            not (eval' e)

        | EAnd (e1, e2) ->
            (eval' e1) && (eval' e2)

        | EOr (e1, e2) ->
            (eval' e1) || (eval' e2)

        | EFlag nm ->
            let v =
              var_get nm
            in
              assert(v = "true" || v = "false");
              (v = "true")

        | ETest (nm, vl) ->
            let v =
              var_get nm
            in
              (v = vl)
    in
      eval' t

  let choose ?printer ?name var_get lst =
    let rec choose_aux =
      function
        | (cond, vl) :: tl ->
            if eval var_get cond then
              vl
            else
              choose_aux tl
        | [] ->
            let str_lst =
              if lst = [] then
                s_ "<empty>"
              else
                String.concat
                  (s_ ", ")
                  (List.map
                     (fun (cond, vl) ->
                        match printer with
                          | Some p -> p vl
                          | None -> s_ "<no printer>")
                     lst)
            in
              match name with
                | Some nm ->
                    failwith
                      (Printf.sprintf
                         (f_ "No result for the choice list '%s': %s")
                         nm str_lst)
                | None ->
                    failwith
                      (Printf.sprintf
                         (f_ "No result for a choice list: %s")
                         str_lst)
    in
      choose_aux (List.rev lst)

end


# 117 "myocamlbuild.ml"
module BaseEnvLight = struct
# 21 "/home/axiles/src/oasis-0.3.0/src/base/BaseEnvLight.ml"

  module MapString = Map.Make(String)

  type t = string MapString.t

  let default_filename =
    Filename.concat
      (Sys.getcwd ())
      "setup.data"

  let load ?(allow_empty=false) ?(filename=default_filename) () =
    if Sys.file_exists filename then
      begin
        let chn =
          open_in_bin filename
        in
        let st =
          Stream.of_channel chn
        in
        let line =
          ref 1
        in
        let st_line =
          Stream.from
            (fun _ ->
               try
                 match Stream.next st with
                   | '\n' -> incr line; Some '\n'
                   | c -> Some c
               with Stream.Failure -> None)
        in
        let lexer =
          Genlex.make_lexer ["="] st_line
        in
        let rec read_file mp =
          match Stream.npeek 3 lexer with
            | [Genlex.Ident nm; Genlex.Kwd "="; Genlex.String value] ->
                Stream.junk lexer;
                Stream.junk lexer;
                Stream.junk lexer;
                read_file (MapString.add nm value mp)
            | [] ->
                mp
            | _ ->
                failwith
                  (Printf.sprintf
                     "Malformed data file '%s' line %d"
                     filename !line)
        in
        let mp =
          read_file MapString.empty
        in
          close_in chn;
          mp
      end
    else if allow_empty then
      begin
        MapString.empty
      end
    else
      begin
        failwith
          (Printf.sprintf
             "Unable to load environment, the file '%s' doesn't exist."
             filename)
      end

  let var_get name env =
    let rec var_expand str =
      let buff =
        Buffer.create ((String.length str) * 2)
      in
        Buffer.add_substitute
          buff
          (fun var ->
             try
               var_expand (MapString.find var env)
             with Not_found ->
               failwith
                 (Printf.sprintf
                    "No variable %s defined when trying to expand %S."
                    var
                    str))
          str;
        Buffer.contents buff
    in
      var_expand (MapString.find name env)

  let var_choose lst env =
    OASISExpr.choose
      (fun nm -> var_get nm env)
      lst
end


# 215 "myocamlbuild.ml"
module MyOCamlbuildFindlib = struct
# 21 "/home/axiles/src/oasis-0.3.0/src/plugins/ocamlbuild/MyOCamlbuildFindlib.ml"

  (** OCamlbuild extension, copied from 
    * http://brion.inria.fr/gallium/index.php/Using_ocamlfind_with_ocamlbuild
    * by N. Pouillard and others
    *
    * Updated on 2009/02/28
    *
    * Modified by Sylvain Le Gall 
    *)
  open Ocamlbuild_plugin

  (* these functions are not really officially exported *)
  let run_and_read = 
    Ocamlbuild_pack.My_unix.run_and_read

  let blank_sep_strings = 
    Ocamlbuild_pack.Lexers.blank_sep_strings

  let split s ch =
    let x = 
      ref [] 
    in
    let rec go s =
      let pos = 
        String.index s ch 
      in
        x := (String.before s pos)::!x;
        go (String.after s (pos + 1))
    in
      try
        go s
      with Not_found -> !x

  let split_nl s = split s '\n'

  let before_space s =
    try
      String.before s (String.index s ' ')
    with Not_found -> s

  (* this lists all supported packages *)
  let find_packages () =
    List.map before_space (split_nl & run_and_read "ocamlfind list")

  (* this is supposed to list available syntaxes, but I don't know how to do it. *)
  let find_syntaxes () = ["camlp4o"; "camlp4r"]

  (* ocamlfind command *)
  let ocamlfind x = S[A"ocamlfind"; x]

  let dispatch =
    function
      | Before_options ->
          (* by using Before_options one let command line options have an higher priority *)
          (* on the contrary using After_options will guarantee to have the higher priority *)
          (* override default commands by ocamlfind ones *)
          Options.ocamlc     := ocamlfind & A"ocamlc";
          Options.ocamlopt   := ocamlfind & A"ocamlopt";
          Options.ocamldep   := ocamlfind & A"ocamldep";
          Options.ocamldoc   := ocamlfind & A"ocamldoc";
          Options.ocamlmktop := ocamlfind & A"ocamlmktop"
                                  
      | After_rules ->
          
          (* When one link an OCaml library/binary/package, one should use -linkpkg *)
          flag ["ocaml"; "link"; "program"] & A"-linkpkg";
          
          (* For each ocamlfind package one inject the -package option when
           * compiling, computing dependencies, generating documentation and
           * linking. *)
          List.iter 
            begin fun pkg ->
              flag ["ocaml"; "compile";  "pkg_"^pkg] & S[A"-package"; A pkg];
              flag ["ocaml"; "ocamldep"; "pkg_"^pkg] & S[A"-package"; A pkg];
              flag ["ocaml"; "doc";      "pkg_"^pkg] & S[A"-package"; A pkg];
              flag ["ocaml"; "link";     "pkg_"^pkg] & S[A"-package"; A pkg];
              flag ["ocaml"; "infer_interface"; "pkg_"^pkg] & S[A"-package"; A pkg];
            end 
            (find_packages ());

          (* Like -package but for extensions syntax. Morover -syntax is useless
           * when linking. *)
          List.iter begin fun syntax ->
          flag ["ocaml"; "compile";  "syntax_"^syntax] & S[A"-syntax"; A syntax];
          flag ["ocaml"; "ocamldep"; "syntax_"^syntax] & S[A"-syntax"; A syntax];
          flag ["ocaml"; "doc";      "syntax_"^syntax] & S[A"-syntax"; A syntax];
          flag ["ocaml"; "infer_interface"; "syntax_"^syntax] & S[A"-syntax"; A syntax];
          end (find_syntaxes ());

          (* The default "thread" tag is not compatible with ocamlfind.
           * Indeed, the default rules add the "threads.cma" or "threads.cmxa"
           * options when using this tag. When using the "-linkpkg" option with
           * ocamlfind, this module will then be added twice on the command line.
           *                        
           * To solve this, one approach is to add the "-thread" option when using
           * the "threads" package using the previous plugin.
           *)
          flag ["ocaml"; "pkg_threads"; "compile"] (S[A "-thread"]);
          flag ["ocaml"; "pkg_threads"; "doc"] (S[A "-I"; A "+threads"]);
          flag ["ocaml"; "pkg_threads"; "link"] (S[A "-thread"]);
          flag ["ocaml"; "pkg_threads"; "infer_interface"] (S[A "-thread"])

      | _ -> 
          ()

end

module MyOCamlbuildBase = struct
# 21 "/home/axiles/src/oasis-0.3.0/src/plugins/ocamlbuild/MyOCamlbuildBase.ml"

  (** Base functions for writing myocamlbuild.ml
      @author Sylvain Le Gall
    *)



  open Ocamlbuild_plugin
  module OC = Ocamlbuild_pack.Ocaml_compiler

  type dir = string 
  type file = string 
  type name = string 
  type tag = string 

# 56 "/home/axiles/src/oasis-0.3.0/src/plugins/ocamlbuild/MyOCamlbuildBase.ml"

  type t =
      {
        lib_ocaml: (name * dir list) list;
        lib_c:     (name * dir * file list) list; 
        flags:     (tag list * (spec OASISExpr.choices)) list;
        (* Replace the 'dir: include' from _tags by a precise interdepends in
         * directory.
         *)
        includes:  (dir * dir list) list; 
      } 

  let env_filename =
    Pathname.basename 
      BaseEnvLight.default_filename

  let dispatch_combine lst =
    fun e ->
      List.iter 
        (fun dispatch -> dispatch e)
        lst 

  let tag_libstubs nm =
    "use_lib"^nm^"_stubs"

  let nm_libstubs nm =
    nm^"_stubs"

  let dispatch t e = 
    let env = 
      BaseEnvLight.load 
        ~filename:env_filename 
        ~allow_empty:true
        ()
    in
      match e with 
        | Before_options ->
            let no_trailing_dot s =
              if String.length s >= 1 && s.[0] = '.' then
                String.sub s 1 ((String.length s) - 1)
              else
                s
            in
              List.iter
                (fun (opt, var) ->
                   try 
                     opt := no_trailing_dot (BaseEnvLight.var_get var env)
                   with Not_found ->
                     Printf.eprintf "W: Cannot get variable %s" var)
                [
                  Options.ext_obj, "ext_obj";
                  Options.ext_lib, "ext_lib";
                  Options.ext_dll, "ext_dll";
                ]

        | After_rules -> 
            (* Declare OCaml libraries *)
            List.iter 
              (function
                 | nm, [] ->
                     ocaml_lib nm
                 | nm, dir :: tl ->
                     ocaml_lib ~dir:dir (dir^"/"^nm);
                     List.iter 
                       (fun dir -> 
                          List.iter
                            (fun str ->
                               flag ["ocaml"; "use_"^nm; str] (S[A"-I"; P dir]))
                            ["compile"; "infer_interface"; "doc"])
                       tl)
              t.lib_ocaml;

            (* Declare directories dependencies, replace "include" in _tags. *)
            List.iter 
              (fun (dir, include_dirs) ->
                 Pathname.define_context dir include_dirs)
              t.includes;

            (* Declare C libraries *)
            List.iter
              (fun (lib, dir, headers) ->
                   (* Handle C part of library *)
                   flag ["link"; "library"; "ocaml"; "byte"; tag_libstubs lib]
                     (S[A"-dllib"; A("-l"^(nm_libstubs lib)); A"-cclib";
                        A("-l"^(nm_libstubs lib))]);

                   flag ["link"; "library"; "ocaml"; "native"; tag_libstubs lib]
                     (S[A"-cclib"; A("-l"^(nm_libstubs lib))]);
                        
                   flag ["link"; "program"; "ocaml"; "byte"; tag_libstubs lib]
                     (S[A"-dllib"; A("dll"^(nm_libstubs lib))]);

                   (* When ocaml link something that use the C library, then one
                      need that file to be up to date.
                    *)
                   dep ["link"; "ocaml"; "program"; tag_libstubs lib]
                     [dir/"lib"^(nm_libstubs lib)^"."^(!Options.ext_lib)];

                   dep  ["compile"; "ocaml"; "program"; tag_libstubs lib]
                     [dir/"lib"^(nm_libstubs lib)^"."^(!Options.ext_lib)];

                   (* TODO: be more specific about what depends on headers *)
                   (* Depends on .h files *)
                   dep ["compile"; "c"] 
                     headers;

                   (* Setup search path for lib *)
                   flag ["link"; "ocaml"; "use_"^lib] 
                     (S[A"-I"; P(dir)]);
              )
              t.lib_c;

              (* Add flags *)
              List.iter
              (fun (tags, cond_specs) ->
                 let spec = 
                   BaseEnvLight.var_choose cond_specs env
                 in
                   flag tags & spec)
              t.flags
        | _ -> 
            ()

  let dispatch_default t =
    dispatch_combine 
      [
        dispatch t;
        MyOCamlbuildFindlib.dispatch;
      ]

end


# 476 "myocamlbuild.ml"
open Ocamlbuild_plugin;;
let package_default =
  {
     MyOCamlbuildBase.lib_ocaml = [("efl", ["src"])];
     lib_c =
       [
          ("efl",
            "src",
            [
               "src/include.h";
               "src/eina_wrap.h";
               "src/evas_wrap.h";
               "src/evas_event_wrap.h";
               "src/evas_object_wrap.h";
               "src/ecore_wrap.h";
               "src/ethumb_wrap.h";
               "src/edje_wrap.h";
               "src/elm_wrap.h";
               "src/elm_object_wrap.h";
               "src/elm_gen_wrap.h";
               "src/elm_dayselector_wrap.h";
               "src/elm_entry_wrap.h";
               "src/elm_icon_wrap.h";
               "src/elm_list_wrap.h";
               "src/elm_scroller_wrap.h";
               "src/elm_web_wrap.h"
            ])
       ];
     flags = [];
     includes = [("examples", ["src"])];
     }
  ;;

let dispatch_default = MyOCamlbuildBase.dispatch_default package_default;;

# 513 "myocamlbuild.ml"
(* OASIS_STOP *)

open Ocamlbuild_plugin
open Printf

let ( & ) f x  = f x

(* The file variants.h is generated: this function adds the rules of builing *)
let write_variants () =
  let action env builder =
    Cmd (S [P "ocaml"; P ("src" / "write_variants.ml"); Sh ">";
      P ("src" / "variants.h")]) in
  rule "write_variants2" ~prod:("src" / "variants.h")
    ~dep:("src" / "write_variants.ml") action;
  (*dep ["c"; "compile"; "efl"] ["src" / "variants.h"]*)
  dep ["extension:c"] ["src" / "variants.h"]

(* Add a rule to generate src/intro.txt *)
let write_intro () =
  let intro = "src" / "intro.txt" in
  let lib = "src" / "efl_doc.odocl" in
  let action env builder =
          Cmd (S [P "ocaml"; P ("src" / "write_intro.ml"); P lib; P intro]) in
  let deps = ["src" / "write_intro.ml"; lib] in
  rule "write_intro" ~prod:intro ~deps action;
  flag_and_dep ["doc"; "extension:html"] (S [A "-intro"; P intro]);
  flag_and_dep ["doc"; "extension:html"] (P ("src" / "start.txt"));
  flag ["doc"; "extension:html"] (Sh "-t \"OCaml EFL Documentation\"");
  flag ["doc"; "extension:html"] (A "-colorize-code")

(* Add rules to generate src/elm_connect{.ml,.mli,_wrap.c}*)
let write_connect () =
  let widgets_filename = "src" / "write_connect" / "widgets.txt" in
  let get_txt_dep () =
    let ch = open_in widgets_filename in
    let r = ref [] in
    (try while true do
      let s = input_line ch in
      r := s :: !r
    done with End_of_file -> ());
    close_in ch;
    let aux s = ["src" / "write_connect" / (sprintf "%s.txt" s)] in
    List.rev_map aux !r in
  let gen_prog = "src" / "write_connect" / "main.cma" in
  let action env builder =
    let deps = get_txt_dep () in
    List.iter (function
    | Outcome.Good _ -> ()
    | Outcome.Bad exn -> raise exn)  (builder deps);
    Cmd (S [P "ocaml"; P gen_prog]) in
  let prods = [
    "src" / "elm_connect.mli";
    "src" / "elm_connect.ml";
    "src" / "elm_connect_wrap.c"
  ] in
  rule "write_connect" ~deps:[gen_prog; widgets_filename] ~prods action

(* Add rules to generate enum bindings *)
let write_enums () =
  let enums_filename = "src" / "write_enums" / "enums.txt" in
  let gen_prog = "src" / "write_enums" / "main.cma" in
  let action _ _ = Cmd (S [P "ocaml"; P gen_prog]) in
  let deps = [gen_prog; enums_filename] in
  let prods = [
    "src" / "henums.ml";
    "src" / "enums_wrap.c";
    "src" / "enums_wrap.h";
    "src" / "enums_variants_wrap.h";
    "src" / "write_enums" / "help.mli";
    "src" / "write_enums" / "help.ml";
    "src" / "henums_check.ml"
  ] in
  rule "write_enums" ~deps ~prods action;
  dep ["extension:c"] prods;
  dep ["file:src/enums_wrap.c"] ["src" / "include.h"]
  (*flag_and_dep ["file:src/efl.cmo"] (P ("src" / "henums_check.cmo"))*)

(* Add rule to generate file efl.mli *)
let write_big_mli () =
  let mlpack_name = "src" / "efl.mlpack" in
  let gen_prog = "src" / "write_big_mli.cma" in
  let action env build =
    let modules = string_list_of_file mlpack_name in
    let check_public = function
      | "Henums" | "Henums_check" -> false
      | _ -> true in
    let public_modules = List.filter check_public modules in
    let mli_of_module s = "src" / String.uncapitalize s ^ ".mli" in
    let mli_files = List.map mli_of_module public_modules in
    let deps = List.map (fun x -> [x]) mli_files in
    List.iter (function
      | Outcome.Good _ -> ()
      | Outcome.Bad exn -> raise exn) (build deps);
    let args = List.map (fun s -> Sh s) public_modules in
    Cmd (S [P "ocaml"; P gen_prog; S args]) in
  let deps = [gen_prog; mlpack_name] in
  let prod = "src" / "efl.mli" in
  rule "write_big_mli" ~deps ~prod action

let () = dispatch & fun h ->
  dispatch_default h;
  match h with
  | After_options ->
    (* We want a clean root directory *)
    Options.make_links := false;

    write_variants ();
    write_intro ();
    write_connect ();
    write_enums ();
    write_big_mli ();

    (* Get the values of the env variables *)
    let env = BaseEnvLight.load () in 
    let elementary_cflags = BaseEnvLight.var_get "elementary_cflags" env in
    let elementary_libs = BaseEnvLight.var_get "elementary_libs" env in

    (* Insert flags and linking information about the EFL *)
    flag ["compile"; "c"] (Sh (sprintf "-ccopt \"%s\"" elementary_cflags));
    flag ["use_libefl_stubs"] (Sh (sprintf "-cclib '%s'" elementary_libs));
    flag ["ocamlmklib"] (Sh elementary_libs);

    (* Removed a harmless warning in generating the documentation *)
    flag ["doc"] (Sh "-hide-warnings");
  | _ -> ()
