#include "include.h"

PREFIX value ml_elm_object_part_text_set(
        value v_obj, value v_part, value v_text)
{
        char* part;
        if(v_part == Val_int(0)) part = NULL;
        else part = String_val(Field(v_part, 0));
        elm_object_part_text_set((Evas_Object*) v_obj, part,
                String_val(v_text));
        return Val_unit;
}

PREFIX value ml_elm_object_part_tex_get(value v_obj, value v_part, value v_unit)
{
        char* part;
        if(v_part == Val_int(0)) part = NULL;
        else part = String_val(Field(v_part, 0));
        const char* text = elm_object_part_text_get((Evas_Object*) v_obj, part);
        if(text == NULL) caml_failwith("elm_object_part_text_get");
        return copy_string(text);
}

PREFIX value ml_elm_object_part_content_set(
        value v_obj, value v_part, value v_content)
{
        char* part;
        if(v_part == Val_int(0)) part = NULL;
        else part = String_val(Field(v_part, 0));
        elm_object_part_content_set((Evas_Object*) v_obj, part,
                (Evas_Object*) v_content);
        return Val_unit;
}

PREFIX value ml_elm_object_part_content_get(value v_obj, value v_part)
{
        char* part;
        if(v_part == Val_int(0)) part = NULL;
        else part = String_val(Field(v_part, 0));
        Evas_Object* content = elm_object_part_content_get((Evas_Object*) v_obj,
                part);
        if(content == NULL) caml_failwith("elm_object_part_content_get");
        return (value) content;
}

PREFIX value ml_elm_object_part_content_unset(
        value v_obj, value v_part, value v_unit)
{
        char* part;
        if(v_part == Val_int(0)) part = NULL;
        else part = String_val(Field(v_part, 0));
        Evas_Object* content = elm_object_part_content_unset(
                (Evas_Object*) v_obj, part);
        if(content == NULL) caml_failwith("elm_object_part_content_unset");
        return (value) content;
}

PREFIX value ml_elm_object_signal_emit(
        value v_obj, value v_emission, value v_source)
{
        elm_object_signal_emit((Evas_Object*) v_obj, String_val(v_emission),
                String_val(v_source));
        return Val_unit;
}

PREFIX ml_elm_object_signal_callback_add(
        value v_obj, value v_emission, value v_source, value v_fun)
{
        CAMLparam4(v_obj, v_emission, v_source, v_fun);
        value* data = caml_stat_alloc(sizeof(value));
        *data = v_fun;
        caml_register_global_root(data);
        elm_object_signal_callback_add((Evas_Object*) v_obj,
                String_val(v_emission), String_val(v_source),
                ml_Edje_Signal_Cb, data);
        CAMLreturn(Val_unit);
}

typedef struct _value_ptr_list {
        value* hd;
        struct _value_ptr_list* tl;
} value_ptr_list;

PREFIX value ml_elm_object_signal_callback_del(
        value v_obj, value v_emission, value v_source, value v_fun)
{
        CAMLparam4(v_obj, v_emission, v_source, v_fun);
        value_ptr_list* list = NULL;
        value_ptr_list* list1;
        value* data;
        Evas_Object* obj = (Evas_Object*) v_obj;
        const char* emission = String_val(v_emission);
        const char* source = String_val(v_source);
        while(1) {
                data = (value*) elm_object_signal_callback_del(obj, emission,
                        source, ml_Edje_Signal_Cb);
                if(*data == v_fun) {
                        caml_remove_global_root(data);
                        free(data);
                        break;
                } else {
                        list1 = list;
                        list = (value_ptr_list*)
                                caml_stat_alloc(sizeof(value_ptr_list));
                        list->hd = data;
                        list->tl = list1;
                }
        }
        while(list != NULL) {
                elm_object_signal_callback_add(obj, emission, source,
                        ml_Edje_Signal_Cb, list->hd);
                list1 = list->tl;
                free(list);
                list = list1;
        }
        CAMLreturn(Val_unit);
}

PREFIX value ml_elm_object_text_set(value v_obj, value v_text)
{
        elm_object_text_set((Evas_Object*) v_obj, String_val(v_text));
        return Val_unit;
}

PREFIX value ml_elm_object_style_set_with_bool(value v_obj, value v_style)
{
        return Val_Eina_Bool(elm_object_style_set((Evas_Object*) v_obj,
                String_val(v_style)));
}

PREFIX value ml_elm_object_content_set(value v_obj, value v_content)
{
        elm_object_content_set((Evas_Object*) v_obj, (Evas_Object*) v_content);
        return Val_unit;
}

PREFIX value ml_elm_object_text_get(value v_obj)
{
        const char* text = elm_object_text_get((Evas_Object*) v_obj);
        if(text == NULL) caml_failwith("elm_object_text_get");
        return copy_string(text);
}

PREFIX value ml_elm_object_content_unset(value v_obj)
{
        Evas_Object* content = elm_object_content_unset((Evas_Object*) v_obj);
        if(content == NULL) caml_failwith("elm_object_content_unset");
        return (value) content;
}

PREFIX value ml_elm_object_disabled_set(value v_obj, value v_flag)
{
        elm_object_disabled_set((Evas_Object*) v_obj, Eina_Bool_val(v_flag));
        return Val_unit;
}

PREFIX value ml_elm_object_disabled_get(value v_obj)
{
        return Val_Eina_Bool(elm_object_disabled_get((Evas_Object*) v_obj));
}

PREFIX value ml_elm_object_focus_set(value v_obj, value v_flag)
{
        elm_object_focus_set((Evas_Object*) v_obj, Eina_Bool_val(v_flag));
        return Val_unit;
}

