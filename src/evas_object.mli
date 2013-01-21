type box_data

type box_layout = Evas.obj -> box_data -> unit

val show : Evas.obj -> unit

val size_hint_weight_set : Evas.obj -> float -> float -> unit

val size_hint_align_set : Evas.obj -> float -> float -> unit

val resize : Evas.obj -> int -> int -> unit

val move : Evas.obj -> int -> int -> unit

val size_hint_align_get : Evas.obj -> float * float

val hide : Evas.obj -> unit

val color_set : Evas.obj -> int -> int -> int -> int -> unit

val del : Evas.obj -> unit

val evas_get : Evas.obj -> Evas.t

val rectangle_add : Evas.t -> Evas.obj
