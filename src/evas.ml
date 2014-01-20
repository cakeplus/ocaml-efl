type ptr

type obj

type t

type smart_cb = obj -> ptr -> unit

type modifier

module Event_mouse_down = struct
  type t = {
    button : int;
    output_x : int;
    output_y : int;
    canvas_x : int;
    canvas_y : int;
    modifiers : modifier;
    flags_double_click : bool;
    flags_triple_click : bool;
  }
end

type event_mouse_down = Event_mouse_down.t

module Event_mouse_up = struct
  type t = {
    button : int;
    output_x : int;
    output_y : int;
    canvas_x : int;
    canvas_y : int;
    modifiers : modifier;
    flags_double_click : bool;
    flags_triple_click : bool;
  }
end

type event_mouse_up = Event_mouse_up.t

module Event_key_down = struct
  type t = {
    keyname : string;
    modifiers : modifier;
    key : string;
    str : string;
    compose : string;
    timestamp : int;
  }
end

type event_key_down = Event_key_down.t

type event_info = [
  | `mouse_down of event_mouse_down
  | `mouse_up of event_mouse_up
  | `key_down of event_key_down
  | `other
]

type aspect_control = [`none | `neither | `horizontal | `vertical | `both]

module Event_type = struct
  type 'a t = {name : string; make_cb : 'a -> smart_cb}
  type 'a v = (obj -> 'a -> unit) t
  type u = (obj -> unit) t
  let create name value_of_ptr =
    let make_cb f obj ptr = f obj (value_of_ptr ptr) in
    {name; make_cb}
  let create_unit name =
    let make_cb f obj ptr = f obj in
    {name; make_cb}
  let get_name et = et.name
  let get_cb et f = et.make_cb f
end 

let hint_expand = 1.

let hint_fill = -1.

external string_of_ptr : ptr -> string = "ml_string_of_ptr"

external string_opt_of_ptr : ptr -> string option = "ml_string_opt_of_ptr"

external pointer_canvas_xy_get : t -> int * int =
  "ml_evas_pointer_canvas_xy_get"

