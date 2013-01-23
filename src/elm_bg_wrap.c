#include "include.h"

PREFIX value ml_elm_bg_add(value v_parent)
{
        Evas_Object* bg = elm_bg_add((Evas_Object*) v_parent);
        if(bg == NULL) caml_failwith("elm_bg_add");
        return (value) bg;
}

PREFIX value ml_elm_bg_file_set(
        value v_obj, value v_file, value v_group, value v_unit)
{
        const char* group;
        if(v_group == Val_int(0)) group = NULL;
        else group = String_val(Field(v_group, 0));
        return Val_Eina_Bool(elm_bg_file_set((Evas_Object*) v_obj,
                String_val(v_file), group));
}
        
PREFIX value ml_elm_bg_color_set(value v_obj, value v_r, value v_g, value v_b)
{
        elm_bg_color_set((Evas_Object*) v_obj, Int_val(v_r), Int_val(v_g),
                Int_val(v_b));
        return Val_unit;
}
