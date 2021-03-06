#include "include.h"

void ml_Edje_Signal_Cb(
        void* data, Evas_Object* obj, const char* emission, const char* source)
{
        CAMLparam0();
        CAMLlocal2(v_emission, v_source);
        value* v_fun = (value*) data;
        v_emission = copy_string(emission);
        v_source = copy_string(source);
        caml_callback3(*v_fun, (value) obj, v_emission, v_source);
        CAMLreturn0;
}

PREFIX value ml_edje_file_collection_list(value v_theme)
{
        Eina_List* list = edje_file_collection_list(String_val(v_theme));
        value v_list = copy_Eina_List_string(list);
        edje_file_collection_list_free(list);
        return v_list;
}

PREFIX value ml_edje_object_add(value v_evas)
{
        Evas_Object* obj = edje_object_add((Evas*) v_evas);
        if(obj == NULL) caml_failwith("edje_object_add");
        return (value) obj;
}

PREFIX value ml_edje_object_file_set(
        value v_obj, value v_file, value v_group, value v_unit)
{
        const char* group;
        if(v_group == Val_int(0)) group = NULL;
        else group = String_val(Field(v_group, 0));
        return Val_Eina_Bool(edje_object_file_set((Evas_Object*) v_obj,
                String_val(v_file), group));
}

PREFIX value ml_edje_object_size_min_calc(value v_obj)
{
        int w, h;
        edje_object_size_min_calc((Evas_Object*) v_obj, &w, &h);
        value v = caml_alloc(2, 0);
        Store_field(v, 0, Val_int(w));
        Store_field(v, 1, Val_int(h));
        return v;
}

