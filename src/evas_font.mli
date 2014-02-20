type hinting_flags = [`none | `auto | `bytecode]

val hinting_set : Evas.t -> hinting_flags -> unit

val hinting_get : Evas.t -> hinting_flags

val hinting_can_hint : Evas.t -> hinting_flags -> bool

val cache_flush : Evas.t -> unit

val cache_set : Evas.t -> int -> unit

val cache_get : Evas.t -> int
