#include "include.h"

PREFIX value ml_elm_photocam_add(value v_parent)
{
        Evas_Object* photocam = elm_photocam_add((Evas_Object*) v_parent);
        if(photocam == NULL) caml_failwith("elm_photocam_add");
        return (value) photocam;
}

PREFIX value ml_elm_photocam_file_get(value v_obj)
{
        const char* file = elm_photocam_file_get((Evas_Object*) v_obj);
        if(file == NULL) caml_failwith("elm_photocam_file_get");
        return copy_string(file);
}

PREFIX value ml_elm_photocam_image_size_get(value v_obj)
{
        int w, h;
        elm_photocam_image_size_get((Evas_Object*) v_obj, &w, &h);
        value v_r = caml_alloc(2, 0);
        Store_field(v_r, 0, Val_int(w));
        Store_field(v_r, 1, Val_int(h));
        return v_r;
}

PREFIX value ml_elm_photocam_image_region_get(value v_obj)
{
        int x, y, w, h;
        elm_photocam_image_region_get((Evas_Object*) v_obj, &x, &y, &w, &h);
        value v = caml_alloc(4, 0);
        Store_field(v, 0, Val_int(x));
        Store_field(v, 1, Val_int(y));
        Store_field(v, 2, Val_int(w));
        Store_field(v, 3, Val_int(h));
        return v;
}

PREFIX value ml_elm_photocam_internal_image_get(value v_obj)
{
        return copy_Evas_Object_opt(elm_photocam_internal_image_get(
                (Evas_Object*) v_obj));
}

PREFIX value ml_Elm_Photocam_Progress_of_ptr(value v_ptr)
{
        CAMLparam1(v_ptr);
        CAMLlocal1(v_r);
        Elm_Photocam_Progress* p = (Elm_Photocam_Progress*) v_ptr;
        v_r = caml_alloc(2, 0);
        Store_field(v_r, 0, copy_double(p->now));
        Store_field(v_r, 1, copy_double(p->total));
        CAMLreturn(v_r);
}

PREFIX value ml_Elm_Photocam_Error_of_ptr(value v_ptr)
{
        Elm_Photocam_Error* e = (Elm_Photocam_Error*) v_ptr;
        value v_r = caml_alloc(1, 0);
        Store_field(v_r, 0, Val_int(e->status));
        Store_field(v_r, 1, Val_bool(e->open_error));
        return v_r;
}


