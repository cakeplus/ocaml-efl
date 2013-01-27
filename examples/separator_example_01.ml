open Efl

let () =
  Elm.init Sys.argv;

  let win = Elm_win.add "separator" `basic in
  Elm_win.title_set win "Separator";
  Elm_win.autodel_set win true;
  let (_ : bool) = Elm.policy_set `quit `last_window_closed in

  let bg = Elm_bg.add win in
  Elm_win.resize_object_add win bg;
  Evas_object.show bg;

  let bx = Elm_box.add win in
  Elm_box.horizontal_set bx true;
  Evas_object.size_hint_weight_set bx Evas.hint_expand Evas.hint_expand;
  Evas_object.size_hint_align_set bx Evas.hint_fill Evas.hint_fill;
  Elm_win.resize_object_add win bx;
  Evas_object.show bx;

  let rect = Evas_object.rectangle_add (Evas_object.evas_get win) in
  Evas_object.color_set rect 0 255 0 255;
  Evas_object.size_hint_min_set rect 90 200;
  Evas_object.size_hint_weight_set rect Evas.hint_expand Evas.hint_expand;
  Evas_object.size_hint_align_set rect Evas.hint_fill Evas.hint_fill;
  Evas_object.show rect;
  Elm_box.pack_end bx rect;

  let separator = Elm_separator.add win in
  Elm_separator.horizontal_set separator true;
  Evas_object.show separator;
  Elm_box.pack_end bx separator;

  let rect = Evas_object.rectangle_add (Evas_object.evas_get win) in
  Evas_object.color_set rect 0 0 255 255;
  Evas_object.size_hint_min_set rect 90 200;
  Evas_object.size_hint_weight_set rect Evas.hint_expand Evas.hint_expand;
  Evas_object.size_hint_align_set rect Evas.hint_fill Evas.hint_fill;
  Evas_object.show rect;
  Elm_box.pack_end bx rect;

  Evas_object.show win;

  Elm.run ();
  Elm.shutdown ()
