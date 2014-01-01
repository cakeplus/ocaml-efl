open Printf

external get_hash_value : string -> string = "ml_get_hash_value"

let f x y = printf "#define %s %s\n" x (get_hash_value y)

let g x = f (sprintf "Val_%s" x) x

let () =
  g "all";
  g "allcharacter";
  g "alpha";
  g "alphabet";
  g "always";
  g "auto";
  g "automatic";
  g "basic";
  g "block_horizontal";
  g "block_vertical";
  g "block_vertical_horizontal";
  g "both";
  g "center";
  g "char";
  g "close";
  g "combo";
  g "compress";
  g "content";
  g "datetime";
  g "default";
  g "desktop";
  g "dialog_basic";
  g "display_only";
  g "dnd";
  g "dock";
  f "Val_done" "_done";
  g "dropdown_menu";
  g "email";
  g "expand";
  g "fdo";
  g "fdo_theme";
  g "file";
  g "flip_horizontal";
  g "flip_transpose";
  g "flip_transverse";
  g "flip_vertical";
  g "focus_back";
  g "focus_forward";
  g "focus_home";
  g "go";
  g "grid";
  g "group";
  g "hard";
  g "hex";
  g "hide";
  g "horizontal";
  g "host";
  f "Val_in" "_in";
  g "inlined_image";
  g "invalid";
  g "ip";
  g "j2me";
  g "join";
  g "keypad";
  g "last";
  g "last_window_closed";
  g "limit";
  g "list";
  g "login";
  g "markup";
  g "markup_utf8";
  g "menu";
  g "middle";
  g "mixed";
  g "month";
  g "neither";
  g "next";
  g "no_block";
  g "no_image";
  g "none";
  g "normal";
  g "notification";
  g "number";
  g "numberonly";
  g "numeric";
  g "off";
  g "on";
  g "opacity_unknown";
  g "opaque";
  g "orient_none";
  g "password";
  g "phone_number";
  g "phonenumber";
  g "pin";
  g "plain_utf8";
  g "plaintext";
  g "popup_menu";
  g "quit";
  g "rotate_180";
  g "rotate_270";
  g "rotate_90";
  g "scale";
  g "scroll";
  g "search";
  g "send";
  g "sentence";
  g "show";
  g "signin";
  g "socket_image";
  g "soft";
  g "splash";
  g "standard";
  g "state";
  g "stretch";
  g "terminal";
  g "text";
  g "theme";
  g "theme_fdo";
  g "tile";
  g "toolbar";
  g "tooltip";
  g "top";
  g "translucent";
  g "transparent";
  g "tree";
  g "unknown";
  g "url";
  g "utility";
  g "vertical";
  g "word";
  flush stdout
