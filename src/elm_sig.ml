type u = Evas.Event_type.u

type 'a v = 'a Evas.Event_type.v

type 'a r = 'a Evas.Event_type.r

let create_unit = Evas.Event_type.create_unit
  
let create = Evas.Event_type.create

let create_ref = Evas.Event_type.create_ref

let create_string x = create x Evas.string_of_ptr

let create_string_opt x = create x Evas.string_opt_of_ptr

let create_entry_anchor_info x = create x Elm_entry.anchor_info_of_ptr
  
let create_item x = create x Elm_object.item_of_ptr

let create_bool x = create x Evas.bool_of_ptr

let create_ref_bool x = create_ref x Evas.store_ptr_bool

let create_obj x = create x Evas.obj_of_ptr

let create_float x = create x Evas.float_of_ptr

let aborted = create_unit "aborted"
let activated = create_unit "activated"
let activated__item = create_item "activated"
let anchor_clicked = create_entry_anchor_info "anchor,clicked"
let anchor_down = create_entry_anchor_info "anchor,down"
let anchor_in = create_entry_anchor_info "anchor,in"
let anchor_out = create_entry_anchor_info "anchor,out"
let anchor_up = create_entry_anchor_info "anchor,up"
let animate_begin = create_unit "animate,begin"
let animate_done = create_unit "animate,done"
let block_clicked = create_unit "block,clicked"
let changed = create_unit "changed"
let changed__item = create_item "changed"
let changed_user = create_unit "changed_user"
let clicked = create_unit "clicked"
let clicked_double = create_unit "clicked,double"
let clicked_double__item = create_item "clicked_double"
let clicked_triple = create_unit "clicked,triple"
let clipboard_state_off = create_unit "clipboard,state,off"
let clipboard_state_on = create_unit "clipboard,state,on"
let contracted = create_item "contracted"
let contract_request = create_item "contract,request"
let cursor_changed = create_unit "cursor,changed"
let cursor_changed_manual = create_unit "cursor,changed,manual"
let delay_changed = create_unit "delay,changed"
let delay_changed__item = create_item "delay,changed"
let delete_request = create_unit "delete,request"
let directory_open = create_string "directory,open"
let dismissed = create_unit "dismissed"
let _done = create_string_opt "done"
let download_request = create "download,request" Elm_web.download_of_ptr
let drag = create_unit "drag"
let drag_start_down = create_unit "drag,start,down"
let drag_start_left = create_unit "drag,start,left"
let drag_start_right = create_unit "drag,start,right"
let drag_start_up = create_unit "drag,start,up"
let drag_stop = create_unit "drag_stop"
let drop = create_string "drop"
let edge_bottom = create_unit "edge,bottom"
let edge_left = create_unit "edge,left"
let edge_right = create_unit "edge,right"
let edge_top = create_unit "edge,top"
let editorclient_contents_changed = create_unit "editorclient,contents,changed"
let editorclient_selection_changed =
  create_unit "editorclient,selection,changed"
let expanded = create_item "expanded"
let expand_request = create_item "expand,request"
let file_chosen = create_string_opt "file,chosen"
let focused = create_unit "focused"
let frame_created = create_obj "frame,create"
let fullscreen = create_unit "fullscreen"
let generate_error = create_unit "generate,error"
let generate_start = create_unit "generate,start"
let generate_stop = create_unit "generate,stop"
let hbar_drag = create_unit "hbar,drag"
let hbar_press = create_unit "hbar,press"
let hbar_unpress = create_unit "hbar,unpress"
let highlighted = create_unit "highlighted"
let highlighted__item = create_item "highlighted"
let iconified = create_unit "iconified"
let icon_received = create_unit "icon,received"
let index_update = create_unit "index,update"
let indicator_prop_changed = create_unit "indicator,prop,changed"
let inputmethod_changed = create_bool "inputmethod,changed"
let ioerr = create_unit "ioerr"
let js_windowobject_clear = create_unit "js,windowobject,clear"
let language_changed = create_unit "language,changed"
let level_down = create_unit "level,down"
let level_up = create_unit "level,up"
let link_hover_in = create "link,hover,in" Evas.string_string_of_ptr
let link_hover_out = create_unit "link,hover,out"
let load_document_finished = create_obj "load,document,finished"
let load_error__frame = create "load,error" Elm_web.frame_load_error_of_ptr
let load_error = create_unit "load,error"
let load_finished = create_unit "load,finished"
let load_newwindow_show = create_unit "load,newwindow,show"
let load_progress = create_float "load,progress"
let load_provisional = create_unit "load,provisional"
let load_started = create_unit "load,started"
let loaded = create_unit "loaded"
let longpressed = create_unit "longpressed"
let maximized = create_unit "maximized"
let menubar_visible_get = create_ref_bool "menubar,visible,get"
let menubar_visible_set = create_bool "menubar,visible,set"
let multi_swipe_down = create_unit "multi,swipe,down"
let multi_swipe_left = create_unit "multi,swipe,left"
let multi_swipe_right = create_unit "multi,swipe,right"
let multi_swipe_up = create_unit "multi,swipe,up"
let multi_pinch_out = create_unit "multi,pinch,out"
let multi_pinch_in = create_unit "multi,pinch,in"
let moved = create_unit "moved"
let moved_after = create_item "moved,after"
let moved_before = create_item "moved,before"
let name_load = create_unit "name,load"
let name_loaded = create_unit "name,loaded"
let name_loaded_fail = create_unit "name,loaded,fail"
let normal = create_unit "normal"
let overflowed = create_unit "overflowed"
let overlay_clicked = create_unit "overlay,clicked"
let popup_created = create "popup,created" Elm_web.menu_of_ptr
let popup_willdelete = create "popup,willdelete" Elm_web.menu_of_ptr
let pos_changed = create_string_opt "pos_changed"
let preedit_changed = create_unit "preedit,changed"
let press = create_unit "press"
let pressed = create_unit "pressed"
let pressed__item = create_item "pressed"
let profile_changed = create_unit "profile,changed"
let ready = create_unit "ready"
let realized = create_item "realized"
let released = create_item "released"
let repeated = create_unit "repeated"
let rotation_changed = create_unit "rotation,changed"
let route_load = create_unit "route,load"
let route_loaded = create_unit "route,loaded"
let route_loaded_fail = create_unit "route,loaded,fail"
let scroll = create_unit "scroll"
let scroll_anim_start = create_unit "scroll,anim,start"
let scroll_anim_stop = create_unit "scroll,anim,stop"
let scroll_drag_start = create_unit "scroll,drag,start"
let scroll_drag_stop = create_unit "scroll,drag,stop"
let scroll_page_changed = create_unit "scroll,page,changed"
let scrollbars_visible_get = create_ref_bool "scrollbars,visible,get"
let scrollbars_visible_set = create_bool "scrollbars,visible,set"
let selected = create_string_opt "selected"
let selected__item = create_item "selected"
let selected_invalid = create_unit "selected,invalid"
let selection_changed = create_unit "selection,changed"
let selection_cleared = create_unit "selection,cleared"
let selection_copy = create_unit "selection,copy"
let selection_cut = create_unit "selection,cut"
let selection_paste = create_unit "selection,paste"
let selection_start = create_unit "selection,start"
let slide_end = create_unit "slide,end"
let slider_drag_start = create_unit "slider,drag,start"
let slider_drag_stop = create_unit "slider,drag,stop"
let smart_changed = create_unit "smart,changed"
let spinner_drag_start = create_unit "spinner,drag,start"
let spinner_drag_stop = create_unit "spinner,drag,stop"
let statusbar_text_set = create_string "statusbar,text,set"
let statusbar_visible_get = create_ref_bool "statusbar,visible,get"
let statusbar_visible_set = create_bool "statusbar,visible,set"
let stick = create_unit "stick"
let swipe = create_unit "swipe"
let text_set_done = create_unit "text,set,done"
let theme_changed = create_unit "theme,changed"
let thumb_done = create_unit "thumb,done"
let thumb_error = create_unit "thumb,error"
let tile_load = create_unit "tile,load"
let tile_loaded = create_unit "tile,loaded"
let tile_loaded_fail = create_unit "tile,loaded,fail"
let timeout = create_unit "timeout"
let title_changed = create_string "title,changed"
let toolbars_visible_get = create_ref_bool "toolbars,visible,get"
let toolbars_visible_set = create_bool "toolbars,visible,set"
let tooltip_text_set = create_string "tooltip,text,set"
let transition_finished = create_unit "transition,finished"
let tree_effect_finished = create_unit "tree,effect,finished"
let underflowed = create_unit "underflowed"
let unfocused = create_unit "unfocused"
let unfullscreen = create_unit "unfullscreen"
let unhighlighted = create_unit "unhighlighted"
let unhighlighted__item = create_item "unhighlighted"
let unmaximized = create_unit "unmaximized"
let unrealized = create_unit "unrealized"
let unselected = create_unit "unselected"
let unselected__item = create_item "unselected"
let unpress = create_unit "unpress"
let unpressed = create_unit "unpressed"
let unstick = create_unit "unstick"
let url_changed = create_string "url,changed"
let vbar_drag = create_unit "vbar,drag"
let vbar_press = create_unit "vbar,press"
let vbar_unpress = create_unit "vbar,unpress"
let view_resized = create_unit "view,resized"
let virtualkeypad_state_off = create_unit "virtualkeypad,state,off"
let virtualkeypad_state_on = create_unit "virtualkeypad,state,on"
let windows_close_request = create_unit "windows,close,request"
let withdrawn = create_unit "widthdrawn"
let zoom_animated_end = create_unit "zoom,animated,end"
let zoom_change = create_unit "zoom,change"
let zoom_start = create_unit "zoom,start"
let zoom_stop = create_unit "zoom,stop"

