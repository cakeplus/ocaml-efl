open Common

let funs = [
  prop "pulse" bool;
  simple_unit "pulse" [evas_object; bool];
  prop "value" double;
  prop "span_size" int;
  prop "horizontal" bool;
  prop "inverted" bool;
]

