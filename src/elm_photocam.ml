include Henums.Elm_photocam

type progress = {now : float; total : float}

type error = {status : int; open_error : bool}

module AF = Autofun.Elm_photocam.F (struct
  type evas_object = Evas.obj
  type elm_photocam_zoom_mode = zoom_mode
  type evas_load_error = Evas.load_error
end)
include AF

external add : Evas.obj -> Evas.obj = "ml_elm_photocam_add"

let addx = Elm_object.create_addx add

external file_get : Evas.obj -> string = "ml_elm_photocam_file_get"

external image_size_get : Evas.obj -> int * int =
  "ml_elm_photocam_image_size_get"

external image_region_get : Evas.obj -> int * int * int * int =
  "ml_elm_photocam_image_region_get"

external internal_image_get : Evas.obj -> Evas.obj option =
  "ml_elm_photocam_internal_image_get"

external progress_of_ptr : Evas.ptr -> progress =
  "ml_Elm_Photocam_Progress_of_ptr"

external error_of_ptr : Evas.ptr -> error = "ml_Elm_Photocam_Error_of_ptr"


