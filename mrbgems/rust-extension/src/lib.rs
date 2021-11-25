use rust_mruby::api::*;
use std::{ffi::CString, ptr::NonNull};

#[no_mangle]
extern "C" fn rust_func(_mrb: *mut mrb_state, _self: mrb_value) -> mrb_value {
    println!("hello world from Rust!!");
    mrb_nil_value()
}

#[no_mangle]
pub extern "C" fn mrb_rust_extension_gem_init(mrb: *mut mrb_state) {
    let mrb = unsafe { NonNull::new(mrb).unwrap().as_mut() };

    let class_name = CString::new("Rust").unwrap();
    let class = unsafe { mrb_define_class(mrb, class_name.as_ptr(), mrb.object_class) };

    let func_name = CString::new("func").unwrap();
    unsafe {
        mrb_define_class_method(
            mrb,
            class,
            func_name.as_ptr(),
            Some(rust_func),
            MRB_ARGS_NONE(),
        )
    }
}

#[no_mangle]
pub extern "C" fn mrb_rust_extension_gem_final(_mrb: *mut mrb_state) {}
