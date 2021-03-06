#include "include.h"

PREFIX value ml_elm_slider_add(value v_parent)
{
        Evas_Object* obj = elm_slider_add((Evas_Object*) v_parent);
        if(obj == NULL) caml_failwith("elm_slider_add");
        return (value) obj;
}

PREFIX value ml_elm_slider_unit_format_set(value v_obj, value v_fmt)
{
        elm_slider_unit_format_set((Evas_Object*) v_obj, String_val(v_fmt));
        return Val_unit;
}

PREFIX value ml_elm_slider_indicator_format_set(value v_obj, value v_fmt)
{
        elm_slider_indicator_format_set((Evas_Object*) v_obj,
                String_val(v_fmt));
        return Val_unit;
}

PREFIX value ml_elm_slider_min_max_get(value v_obj)
{
        CAMLparam1(v_obj);
        CAMLlocal1(v_r);
        double min, max;
        elm_slider_min_max_get((Evas_Object*) v_obj, &min, &max);
        v_r = caml_alloc(2, 0);
        Store_field(v_r, 0, copy_double(min));
        Store_field(v_r, 1, copy_double(max));
        CAMLreturn(v_r);
}

