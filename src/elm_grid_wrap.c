#include "include.h"

PREFIX value ml_elm_grid_add(value v_parent)
{
        Evas_Object* obj = elm_grid_add((Evas_Object*) v_parent);
        if(obj == NULL) caml_failwith("elm_grid_add");
        return (value) obj;
}

