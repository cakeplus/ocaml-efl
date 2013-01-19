type ty = [
  | `basic
  | `dialog_basic
  | `desktop
  | `dock
  | `toolbar
  | `menu
  | `utility
  | `splash
  | `dropdown_menu
  | `popup_menu
  | `tooltip
  | `notification
  | `combo
  | `dnd
  | `inlined_image
  | `socket_image]

val add : ?p:Evas.obj -> string -> ty -> Evas.obj

val util_standard_add : string -> string -> Evas.obj

val resize_object_add : Evas.obj -> Evas.obj -> unit

val resize_object_del : Evas.obj -> Evas.obj -> unit

val title_set : Evas.obj -> string -> unit

val title_get : Evas.obj -> string

val icon_name_set : Evas.obj -> string -> unit

val icon_name_get : Evas.obj -> string

val role_set : Evas.obj -> string -> unit

val role_get : Evas.obj -> string

val icon_object_set : Evas.obj -> Evas.obj -> unit

val icon_object_get : Evas.obj -> Evas.obj

val autodel_set : Evas.obj -> bool -> unit

val autodel_get : Evas.obj -> bool

val activate : Evas.obj -> unit

val lower : Evas.obj -> unit

(** elm_win_raise *)
val raises : Evas.obj -> unit

val center : Evas.obj -> bool -> bool -> unit

val borderless_set : Evas.obj -> bool -> unit

val borderless_get : Evas.obj -> bool

val shaped_set : Evas.obj -> bool -> unit

val shaped_get : Evas.obj -> bool

val alpha_set : Evas.obj -> bool -> unit

val alpha_get : Evas.obj -> bool

val override_set : Evas.obj -> bool -> unit

val override_get : Evas.obj -> bool

val fullscreen_set : Evas.obj -> bool -> unit

val fullscreen_get : Evas.obj -> bool

val maximized_set : Evas.obj -> bool -> unit

val maximized_get : Evas.obj -> bool

val iconified_set : Evas.obj -> bool -> unit

val iconified_get : Evas.obj -> bool

val withdrawn_set : Evas.obj -> bool -> unit

val withdrawn_get : Evas.obj -> bool

val urgent_set : Evas.obj -> bool -> unit

val urgent_get : Evas.obj -> bool

val demand_attention_set : Evas.obj -> bool -> unit

val demand_attention_get : Evas.obj -> bool

val modal_set : Evas.obj -> bool -> unit

val modal_get : Evas.obj -> bool

val aspect_set : Evas.obj -> float -> unit

val aspect_get : Evas.obj -> float

val size_base_set : Evas.obj -> int -> int -> unit

val size_base_get : Evas.obj -> int * int

val size_step_set : Evas.obj -> int -> int -> unit

val size_step_get : Evas.obj -> int * int

val layer_set : Evas.obj -> int -> unit

val layer_get : Evas.obj -> int

val rotation_set : Evas.obj -> int -> unit

val rotation_with_resize_set : Evas.obj -> int -> unit

val rotation_get : Evas.obj -> int

val sticky_set : Evas.obj -> bool -> unit

val sticky_get : Evas.obj -> bool

val conformant_set : Evas.obj -> bool -> unit

val conformant_get : Evas.obj -> bool

val quickpanel_set : Evas.obj -> bool -> unit

val quickpanel_get : Evas.obj -> bool

val quickpanel_priority_major_set : Evas.obj -> int -> unit

val quickpanel_priority_major_get : Evas.obj -> int

val quickpanel_priority_minor_set : Evas.obj -> int -> unit

val quickpanel_priority_minor_get : Evas.obj -> int

val quickpanel_zone_set : Evas.obj -> int -> unit

val quickpanel_zone_get : Evas.obj -> int

val prop_focus_skip_set : Evas.obj -> bool -> unit

