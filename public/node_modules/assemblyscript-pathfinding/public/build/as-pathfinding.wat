(module
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $none_=>_none (func))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $i32_=>_none (func (param i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (type $i32_i32_f32_=>_none (func (param i32 i32 f32)))
 (type $i32_f32_i32_=>_none (func (param i32 f32 i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $i32_i32_i32_i32_i32_=>_i32 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $i32_f32_=>_i32 (func (param i32 f32) (result i32)))
 (type $i32_f32_i32_=>_i32 (func (param i32 f32 i32) (result i32)))
 (type $i32_i32_=>_f32 (func (param i32 i32) (result f32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 1024) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data (i32.const 1072) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data (i32.const 1136) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t")
 (data (i32.const 1200) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s")
 (data (i32.const 1252) "\01")
 (data (i32.const 1264) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data (i32.const 1312) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s")
 (data (i32.const 1364) "\01")
 (data (i32.const 1376) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00A\00r\00r\00a\00y\00 \00i\00s\00 \00e\00m\00p\00t\00y")
 (data (i32.const 1424) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data (i32.const 1488) "^\00\00\00\01\00\00\00\01\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data (i32.const 1600) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data (i32.const 1668) "\01")
 (data (i32.const 1680) "\14\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00a\08\00\00\02\00\00\00a\00\00\00\02\00\00\00\a1\08\00\00\02\00\00\00\a1\00\00\00\02\00\00\00!\t\00\00\02\00\00\00!\01\00\00\02\00\00\00!\19\00\00\02\00\00\00!\1a\00\00\02\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00\"A\00\00\00\00\00\000A2\00\00\00\00\000a\82\00\00\00\00\000\t\82\00\00\00\00\00\"\t\00\00\00\00\00\00\"\19\00\00\00\00\00\00\"A")
 (global $~lib/rt/stub/startOffset (mut i32) (i32.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_String_ID i32 (i32.const 1))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_ArrayBuffer_ID i32 (i32.const 0))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_ArrayBufferView_ID i32 (i32.const 2))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int8Array_ID i32 (i32.const 3))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint8Array_ID i32 (i32.const 4))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int16Array_ID i32 (i32.const 5))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint16Array_ID i32 (i32.const 6))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int32Array_ID i32 (i32.const 7))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint32Array_ID i32 (i32.const 8))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Float32Array_ID i32 (i32.const 9))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Float64Array_ID i32 (i32.const 10))
 (global $~lib/rt/__rtti_base i32 (i32.const 1680))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/stub/__alloc))
 (export "__retain" (func $~lib/rt/stub/__retain))
 (export "__release" (func $~lib/rt/stub/__release))
 (export "__collect" (func $~lib/rt/stub/__collect))
 (export "__reset" (func $~lib/rt/stub/__reset))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "__asbind_String_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_String_ID))
 (export "__asbind_ArrayBuffer_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_ArrayBuffer_ID))
 (export "__asbind_ArrayBufferView_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_ArrayBufferView_ID))
 (export "__asbind_Int8Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int8Array_ID))
 (export "__asbind_Uint8Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint8Array_ID))
 (export "__asbind_Int16Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int16Array_ID))
 (export "__asbind_Uint16Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint16Array_ID))
 (export "__asbind_Int32Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int32Array_ID))
 (export "__asbind_Uint32Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint32Array_ID))
 (export "__asbind_Float32Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Float32Array_ID))
 (export "__asbind_Float64Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Float64Array_ID))
 (export "findPath" (func $assembly/index/findPath))
 (start $~start)
 (func $~lib/rt/stub/maybeGrowMemory (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  memory.size
  local.tee $2
  i32.const 16
  i32.shl
  local.tee $1
  i32.gt_u
  if
   local.get $2
   local.get $0
   local.get $1
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $1
   local.get $2
   local.get $1
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $1
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $0
  global.set $~lib/rt/stub/offset
 )
 (func $~lib/rt/stub/__alloc (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.const 1073741808
  i32.gt_u
  if
   unreachable
  end
  global.get $~lib/rt/stub/offset
  i32.const 16
  i32.add
  local.tee $3
  local.get $0
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.tee $2
  i32.const 16
  local.get $2
  i32.const 16
  i32.gt_u
  select
  local.tee $4
  i32.add
  call $~lib/rt/stub/maybeGrowMemory
  local.get $3
  i32.const 16
  i32.sub
  local.tee $2
  local.get $4
  i32.store
  local.get $2
  i32.const 1
  i32.store offset=4
  local.get $2
  local.get $1
  i32.store offset=8
  local.get $2
  local.get $0
  i32.store offset=12
  local.get $3
 )
 (func $~lib/rt/stub/__retain (param $0 i32) (result i32)
  local.get $0
 )
 (func $~lib/rt/stub/__release (param $0 i32)
  nop
 )
 (func $~lib/rt/stub/__collect
  nop
 )
 (func $~lib/rt/stub/__reset
  global.get $~lib/rt/stub/startOffset
  global.set $~lib/rt/stub/offset
 )
 (func $assembly/index/Point#constructor (result i32)
  (local $0 i32)
  i32.const 8
  i32.const 11
  call $~lib/rt/stub/__alloc
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
 )
 (func $~lib/memory/memory.fill (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $~lib/util/memory/memset|inlined.0
   local.get $1
   i32.eqz
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 0
   i32.store8
   local.get $0
   local.get $1
   i32.add
   i32.const 4
   i32.sub
   local.tee $2
   i32.const 0
   i32.store8 offset=3
   local.get $1
   i32.const 2
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 0
   i32.store8 offset=1
   local.get $0
   i32.const 0
   i32.store8 offset=2
   local.get $2
   i32.const 0
   i32.store8 offset=2
   local.get $2
   i32.const 0
   i32.store8 offset=1
   local.get $1
   i32.const 6
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 0
   i32.store8 offset=3
   local.get $2
   i32.const 0
   i32.store8
   local.get $1
   i32.const 8
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 0
   local.get $0
   i32.sub
   i32.const 3
   i32.and
   local.tee $2
   i32.add
   local.tee $0
   i32.const 0
   i32.store
   local.get $0
   local.get $1
   local.get $2
   i32.sub
   i32.const -4
   i32.and
   local.tee $2
   i32.add
   i32.const 28
   i32.sub
   local.tee $1
   i32.const 0
   i32.store offset=24
   local.get $2
   i32.const 8
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 0
   i32.store offset=4
   local.get $0
   i32.const 0
   i32.store offset=8
   local.get $1
   i32.const 0
   i32.store offset=16
   local.get $1
   i32.const 0
   i32.store offset=20
   local.get $2
   i32.const 24
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 0
   i32.store offset=12
   local.get $0
   i32.const 0
   i32.store offset=16
   local.get $0
   i32.const 0
   i32.store offset=20
   local.get $0
   i32.const 0
   i32.store offset=24
   local.get $1
   i32.const 0
   i32.store
   local.get $1
   i32.const 0
   i32.store offset=4
   local.get $1
   i32.const 0
   i32.store offset=8
   local.get $1
   i32.const 0
   i32.store offset=12
   local.get $0
   local.get $0
   i32.const 4
   i32.and
   i32.const 24
   i32.add
   local.tee $1
   i32.add
   local.set $0
   local.get $2
   local.get $1
   i32.sub
   local.set $1
   loop $while-continue|0
    local.get $1
    i32.const 32
    i32.ge_u
    if
     local.get $0
     i64.const 0
     i64.store
     local.get $0
     i64.const 0
     i64.store offset=8
     local.get $0
     i64.const 0
     i64.store offset=16
     local.get $0
     i64.const 0
     i64.store offset=24
     local.get $1
     i32.const 32
     i32.sub
     local.set $1
     local.get $0
     i32.const 32
     i32.add
     local.set $0
     br $while-continue|0
    end
   end
  end
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 1073741808
  i32.gt_u
  if
   i32.const 1040
   i32.const 1088
   i32.const 49
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 0
  call $~lib/rt/stub/__alloc
  local.tee $1
  local.get $0
  call $~lib/memory/memory.fill
  local.get $1
 )
 (func $~lib/util/hash/hash32 (param $0 i32) (result i32)
  local.get $0
  i32.const 255
  i32.and
  i32.const -2128831035
  i32.xor
  i32.const 16777619
  i32.mul
  local.get $0
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.get $0
  i32.const 16
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.get $0
  i32.const 24
  i32.shr_u
  i32.xor
  i32.const 16777619
  i32.mul
 )
 (func $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#find (param $0 i32) (param $1 f32) (param $2 i32) (result i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  loop $while-continue|0
   local.get $0
   if
    local.get $0
    i32.load offset=8
    i32.const 1
    i32.and
    if (result i32)
     i32.const 0
    else
     local.get $0
     f32.load
     local.get $1
     f32.eq
    end
    if
     local.get $0
     return
    end
    local.get $0
    i32.load offset=8
    i32.const -2
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $~lib/memory/memory.copy (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  block $~lib/util/memory/memmove|inlined.0
   local.get $2
   local.set $4
   local.get $0
   local.get $1
   i32.eq
   br_if $~lib/util/memory/memmove|inlined.0
   local.get $0
   local.get $1
   i32.lt_u
   if
    local.get $1
    i32.const 7
    i32.and
    local.get $0
    i32.const 7
    i32.and
    i32.eq
    if
     loop $while-continue|0
      local.get $0
      i32.const 7
      i32.and
      if
       local.get $4
       i32.eqz
       br_if $~lib/util/memory/memmove|inlined.0
       local.get $4
       i32.const 1
       i32.sub
       local.set $4
       local.get $0
       local.tee $2
       i32.const 1
       i32.add
       local.set $0
       local.get $1
       local.tee $3
       i32.const 1
       i32.add
       local.set $1
       local.get $2
       local.get $3
       i32.load8_u
       i32.store8
       br $while-continue|0
      end
     end
     loop $while-continue|1
      local.get $4
      i32.const 8
      i32.ge_u
      if
       local.get $0
       local.get $1
       i64.load
       i64.store
       local.get $4
       i32.const 8
       i32.sub
       local.set $4
       local.get $0
       i32.const 8
       i32.add
       local.set $0
       local.get $1
       i32.const 8
       i32.add
       local.set $1
       br $while-continue|1
      end
     end
    end
    loop $while-continue|2
     local.get $4
     if
      local.get $0
      local.tee $2
      i32.const 1
      i32.add
      local.set $0
      local.get $1
      local.tee $3
      i32.const 1
      i32.add
      local.set $1
      local.get $2
      local.get $3
      i32.load8_u
      i32.store8
      local.get $4
      i32.const 1
      i32.sub
      local.set $4
      br $while-continue|2
     end
    end
   else
    local.get $1
    i32.const 7
    i32.and
    local.get $0
    i32.const 7
    i32.and
    i32.eq
    if
     loop $while-continue|3
      local.get $0
      local.get $4
      i32.add
      i32.const 7
      i32.and
      if
       local.get $4
       i32.eqz
       br_if $~lib/util/memory/memmove|inlined.0
       local.get $4
       i32.const 1
       i32.sub
       local.tee $4
       local.get $0
       i32.add
       local.get $1
       local.get $4
       i32.add
       i32.load8_u
       i32.store8
       br $while-continue|3
      end
     end
     loop $while-continue|4
      local.get $4
      i32.const 8
      i32.ge_u
      if
       local.get $4
       i32.const 8
       i32.sub
       local.tee $4
       local.get $0
       i32.add
       local.get $1
       local.get $4
       i32.add
       i64.load
       i64.store
       br $while-continue|4
      end
     end
    end
    loop $while-continue|5
     local.get $4
     if
      local.get $4
      i32.const 1
      i32.sub
      local.tee $4
      local.get $0
      i32.add
      local.get $1
      local.get $4
      i32.add
      i32.load8_u
      i32.store8
      br $while-continue|5
     end
    end
   end
  end
 )
 (func $~lib/rt/__allocArray (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 16
  local.get $1
  call $~lib/rt/stub/__alloc
  local.set $1
  local.get $0
  i32.const 2
  i32.shl
  local.tee $4
  local.set $5
  local.get $4
  i32.const 0
  call $~lib/rt/stub/__alloc
  local.set $3
  local.get $2
  if
   local.get $3
   local.get $2
   local.get $5
   call $~lib/memory/memory.copy
  end
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $4
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#rehash (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $1
  i32.const 1
  i32.add
  local.tee $3
  i32.const 2
  i32.shl
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $3
  i32.const 3
  i32.shl
  i32.const 3
  i32.div_s
  local.tee $6
  i32.const 12
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $0
  i32.load offset=8
  local.tee $4
  local.get $0
  i32.load offset=16
  i32.const 12
  i32.mul
  i32.add
  local.set $7
  local.get $3
  local.set $2
  loop $while-continue|0
   local.get $4
   local.get $7
   i32.ne
   if
    local.get $4
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $2
     local.get $4
     f32.load
     f32.store
     local.get $2
     local.get $4
     i32.load offset=4
     i32.store offset=4
     local.get $2
     local.get $4
     f32.load
     i32.reinterpret_f32
     call $~lib/util/hash/hash32
     local.get $1
     i32.and
     i32.const 2
     i32.shl
     local.get $5
     i32.add
     local.tee $8
     i32.load
     i32.store offset=8
     local.get $8
     local.get $2
     i32.store
     local.get $2
     i32.const 12
     i32.add
     local.set $2
    end
    local.get $4
    i32.const 12
    i32.add
    local.set $4
    br $while-continue|0
   end
  end
  local.get $0
  i32.load
  drop
  local.get $0
  local.get $5
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  i32.load offset=8
  drop
  local.get $0
  local.get $3
  i32.store offset=8
  local.get $0
  local.get $6
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#set (param $0 i32) (param $1 f32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  local.get $1
  i32.reinterpret_f32
  call $~lib/util/hash/hash32
  local.tee $4
  call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#find
  local.tee $3
  if
   local.get $2
   local.get $3
   i32.load offset=4
   i32.ne
   if
    local.get $3
    local.get $2
    i32.store offset=4
   end
  else
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#rehash
   end
   local.get $0
   i32.load offset=8
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $5
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $5
   i32.const 12
   i32.mul
   i32.add
   local.tee $3
   local.get $1
   f32.store
   local.get $3
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $3
   local.get $0
   i32.load
   local.get $4
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $3
   i32.store
  end
 )
 (func $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#get (param $0 i32) (param $1 f32) (result i32)
  local.get $0
  local.get $1
  local.get $1
  i32.reinterpret_f32
  call $~lib/util/hash/hash32
  call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#find
  local.tee $0
  i32.eqz
  if
   i32.const 1152
   i32.const 1216
   i32.const 104
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
 )
 (func $~lib/rt/stub/__realloc (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 15
  i32.and
  i32.eqz
  i32.const 0
  local.get $0
  select
  i32.eqz
  if
   i32.const 0
   i32.const 1328
   i32.const 41
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.sub
  local.tee $3
  i32.load
  local.set $4
  local.get $3
  i32.load offset=4
  i32.const 1
  i32.ne
  if
   i32.const 0
   i32.const 1328
   i32.const 44
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.get $0
  local.get $4
  i32.add
  i32.eq
  local.set $5
  local.get $1
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.set $2
  local.get $1
  local.get $4
  i32.gt_u
  if
   local.get $5
   if
    local.get $1
    i32.const 1073741808
    i32.gt_u
    if
     unreachable
    end
    local.get $0
    local.get $2
    i32.add
    call $~lib/rt/stub/maybeGrowMemory
    local.get $3
    local.get $2
    i32.store
   else
    local.get $2
    local.get $4
    i32.const 1
    i32.shl
    local.tee $4
    local.get $2
    local.get $4
    i32.gt_u
    select
    local.get $3
    i32.load offset=8
    call $~lib/rt/stub/__alloc
    local.tee $2
    local.get $0
    local.get $3
    i32.load offset=12
    call $~lib/memory/memory.copy
    local.get $2
    local.tee $0
    i32.const 16
    i32.sub
    local.set $3
   end
  else
   local.get $5
   if
    local.get $0
    local.get $2
    i32.add
    global.set $~lib/rt/stub/offset
    local.get $3
    local.get $2
    i32.store
   end
  end
  local.get $3
  local.get $1
  i32.store offset=12
  local.get $0
 )
 (func $~lib/array/ensureSize (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $2
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 268435452
   i32.gt_u
   if
    i32.const 1040
    i32.const 1280
    i32.const 14
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   local.get $0
   i32.load
   local.tee $4
   local.get $1
   i32.const 2
   i32.shl
   local.tee $3
   call $~lib/rt/stub/__realloc
   local.tee $1
   i32.add
   local.get $3
   local.get $2
   i32.sub
   call $~lib/memory/memory.fill
   local.get $1
   local.get $4
   i32.ne
   if
    local.get $0
    local.get $1
    i32.store
    local.get $0
    local.get $1
    i32.store offset=4
   end
   local.get $0
   local.get $3
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<assembly/index/Point>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 1
  i32.add
  local.tee $3
  call $~lib/array/ensureSize
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store
  local.get $0
  local.get $3
  i32.store offset=12
 )
 (func $assembly/index/ProrityQueue#push (param $0 i32) (param $1 i32) (param $2 f32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  local.set $3
  local.get $0
  i32.load
  local.get $2
  local.get $2
  i32.reinterpret_f32
  call $~lib/util/hash/hash32
  call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#find
  if
   local.get $0
   i32.load
   local.get $2
   call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#get
   local.tee $1
   i32.eqz
   if
    i32.const 0
    i32.const 13
    i32.const 1264
    call $~lib/rt/__allocArray
    local.set $1
   end
   local.get $1
   local.get $3
   call $~lib/array/Array<assembly/index/Point>#push
   local.get $0
   i32.load
   local.get $2
   local.get $1
   call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#set
  else
   local.get $0
   i32.load
   i32.const 1
   i32.const 13
   i32.const 0
   call $~lib/rt/__allocArray
   local.tee $4
   i32.load offset=4
   local.get $3
   i32.store
   local.get $2
   local.get $4
   call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#set
  end
  local.get $2
  local.get $0
  f32.load offset=4
  f32.gt
  if
   local.get $0
   local.get $2
   f32.store offset=4
  end
 )
 (func $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#find (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $2
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  loop $while-continue|0
   local.get $0
   if
    local.get $0
    i32.load offset=8
    i32.const 1
    i32.and
    if (result i32)
     i32.const 0
    else
     local.get $0
     i32.load
     local.get $1
     i32.eq
    end
    if
     local.get $0
     return
    end
    local.get $0
    i32.load offset=8
    i32.const -2
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#rehash (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $1
  i32.const 1
  i32.add
  local.tee $3
  i32.const 2
  i32.shl
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $3
  i32.const 3
  i32.shl
  i32.const 3
  i32.div_s
  local.tee $6
  i32.const 12
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $0
  i32.load offset=8
  local.tee $4
  local.get $0
  i32.load offset=16
  i32.const 12
  i32.mul
  i32.add
  local.set $7
  local.get $3
  local.set $2
  loop $while-continue|0
   local.get $4
   local.get $7
   i32.ne
   if
    local.get $4
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $2
     local.get $4
     i32.load
     i32.store
     local.get $2
     local.get $4
     i32.load offset=4
     i32.store offset=4
     local.get $2
     local.get $4
     i32.load
     call $~lib/util/hash/hash32
     local.get $1
     i32.and
     i32.const 2
     i32.shl
     local.get $5
     i32.add
     local.tee $8
     i32.load
     i32.store offset=8
     local.get $8
     local.get $2
     i32.store
     local.get $2
     i32.const 12
     i32.add
     local.set $2
    end
    local.get $4
    i32.const 12
    i32.add
    local.set $4
    br $while-continue|0
   end
  end
  local.get $0
  i32.load
  drop
  local.get $0
  local.get $5
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  i32.load offset=8
  drop
  local.get $0
  local.get $3
  i32.store offset=8
  local.get $0
  local.get $6
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/hash32
  local.tee $4
  call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#find
  local.tee $3
  if
   local.get $2
   local.get $3
   i32.load offset=4
   i32.ne
   if
    local.get $3
    local.get $2
    i32.store offset=4
   end
  else
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#rehash
   end
   local.get $0
   i32.load offset=8
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $5
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $5
   i32.const 12
   i32.mul
   i32.add
   local.tee $3
   local.get $1
   i32.store
   local.get $3
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $3
   local.get $0
   i32.load
   local.get $4
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $3
   i32.store
  end
 )
 (func $~lib/map/Map<assembly/index/Point,i32>#set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/hash32
  local.tee $4
  call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#find
  local.tee $3
  if
   local.get $3
   local.get $2
   i32.store offset=4
  else
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#rehash
   end
   local.get $0
   i32.load offset=8
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $5
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $5
   i32.const 12
   i32.mul
   i32.add
   local.tee $3
   local.get $1
   i32.store
   local.get $3
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $3
   local.get $0
   i32.load
   local.get $4
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $3
   i32.store
  end
 )
 (func $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#keys (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 f32)
  local.get $0
  i32.load offset=8
  local.set $7
  local.get $0
  i32.load offset=16
  local.tee $5
  local.set $0
  i32.const 16
  i32.const 18
  call $~lib/rt/stub/__alloc
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store offset=12
  local.get $5
  i32.const 268435452
  i32.gt_u
  if
   i32.const 1040
   i32.const 1280
   i32.const 57
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 0
  call $~lib/rt/stub/__alloc
  local.tee $6
  local.get $3
  call $~lib/memory/memory.fill
  local.get $2
  i32.load
  drop
  local.get $2
  local.get $6
  i32.store
  local.get $2
  local.get $6
  i32.store offset=4
  local.get $2
  local.get $3
  i32.store offset=8
  local.get $2
  local.get $0
  i32.store offset=12
  loop $for-loop|0
   local.get $4
   local.get $5
   i32.lt_s
   if
    local.get $7
    local.get $4
    i32.const 12
    i32.mul
    i32.add
    local.tee $3
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $1
     local.tee $0
     i32.const 1
     i32.add
     local.set $1
     local.get $3
     f32.load
     local.set $8
     local.get $0
     local.get $2
     i32.load offset=12
     i32.ge_u
     if
      local.get $0
      i32.const 0
      i32.lt_s
      if
       i32.const 1440
       i32.const 1280
       i32.const 120
       i32.const 22
       call $~lib/builtins/abort
       unreachable
      end
      local.get $2
      local.get $0
      i32.const 1
      i32.add
      local.tee $3
      call $~lib/array/ensureSize
      local.get $2
      local.get $3
      i32.store offset=12
     end
     local.get $2
     i32.load offset=4
     local.get $0
     i32.const 2
     i32.shl
     i32.add
     local.get $8
     f32.store
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $2
  i32.load offset=12
  drop
  local.get $2
  local.get $1
  call $~lib/array/ensureSize
  local.get $2
  local.get $1
  i32.store offset=12
  local.get $2
 )
 (func $~lib/array/Array<f32>#__get (param $0 i32) (param $1 i32) (result f32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 1440
   i32.const 1280
   i32.const 104
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  f32.load
 )
 (func $assembly/index/ProrityQueue#pop (param $0 i32) (result i32)
  (local $1 f32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 f32)
  (local $7 i32)
  local.get $0
  i32.load
  local.get $0
  f32.load offset=4
  call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#get
  local.tee $2
  i32.eqz
  if
   i32.const 0
   i32.const 13
   i32.const 1376
   call $~lib/rt/__allocArray
   local.set $2
  end
  local.get $2
  i32.load offset=12
  local.tee $3
  i32.const 1
  i32.lt_s
  if
   i32.const 1392
   i32.const 1280
   i32.const 300
   i32.const 21
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.load offset=4
  local.get $3
  i32.const 1
  i32.sub
  local.tee $3
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.get $2
  local.get $3
  i32.store offset=12
  local.get $2
  i32.load offset=12
  if
   local.get $0
   i32.load
   local.get $0
   f32.load offset=4
   local.get $2
   call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#set
  else
   local.get $0
   i32.load
   local.tee $2
   local.get $0
   f32.load offset=4
   local.tee $6
   local.get $6
   i32.reinterpret_f32
   call $~lib/util/hash/hash32
   call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#find
   local.tee $3
   if
    local.get $3
    i32.load offset=4
    drop
    local.get $3
    local.get $3
    i32.load offset=8
    i32.const 1
    i32.or
    i32.store offset=8
    local.get $2
    local.get $2
    i32.load offset=20
    i32.const 1
    i32.sub
    i32.store offset=20
    local.get $2
    i32.load offset=4
    i32.const 1
    i32.shr_u
    local.tee $7
    i32.const 1
    i32.add
    i32.const 4
    local.get $2
    i32.load offset=20
    local.tee $3
    i32.const 4
    local.get $3
    i32.gt_u
    select
    i32.ge_u
    if (result i32)
     local.get $2
     i32.load offset=20
     local.get $2
     i32.load offset=12
     i32.const 3
     i32.mul
     i32.const 4
     i32.div_s
     i32.lt_s
    else
     i32.const 0
    end
    if
     local.get $2
     local.get $7
     call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#rehash
    end
   end
   local.get $0
   i32.load
   call $~lib/map/Map<f32,~lib/array/Array<assembly/index/Point>>#keys
   local.set $2
   loop $for-loop|0
    local.get $4
    local.get $2
    i32.load offset=12
    i32.lt_s
    if
     local.get $2
     local.get $4
     call $~lib/array/Array<f32>#__get
     local.get $1
     f32.gt
     if
      local.get $2
      local.get $4
      call $~lib/array/Array<f32>#__get
      local.set $1
     end
     local.get $4
     i32.const 1
     i32.add
     local.set $4
     br $for-loop|0
    end
   end
   local.get $0
   local.get $1
   f32.store offset=4
  end
 )
 (func $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#get (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/hash32
  call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#find
  local.tee $0
  i32.eqz
  if
   i32.const 1152
   i32.const 1216
   i32.const 104
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
 )
 (func $~lib/typedarray/Int8Array#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 12
  i32.const 3
  call $~lib/rt/stub/__alloc
  local.tee $1
  i32.eqz
  if
   i32.const 12
   i32.const 2
   call $~lib/rt/stub/__alloc
   local.set $1
  end
  local.get $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 1073741808
  i32.gt_u
  if
   i32.const 1040
   i32.const 1088
   i32.const 18
   i32.const 57
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 0
  call $~lib/rt/stub/__alloc
  local.tee $2
  local.get $0
  call $~lib/memory/memory.fill
  local.get $1
  i32.load
  drop
  local.get $1
  local.get $2
  i32.store
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store offset=8
  local.get $1
 )
 (func $~lib/array/Array<~lib/array/Array<i32>>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 1440
   i32.const 1280
   i32.const 104
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  local.get $0
  i32.eqz
  if
   i32.const 1504
   i32.const 1280
   i32.const 108
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/array/Array<i32>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 1440
   i32.const 1280
   i32.const 104
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $~lib/typedarray/Int8Array#__set (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 1440
   i32.const 1616
   i32.const 35
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/typedarray/Int8Array#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 1440
   i32.const 1616
   i32.const 24
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  i32.load8_s
 )
 (func $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#keys (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load offset=8
  local.set $7
  local.get $0
  i32.load offset=16
  local.tee $5
  local.set $1
  i32.const 16
  i32.const 13
  call $~lib/rt/stub/__alloc
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $5
  i32.const 268435452
  i32.gt_u
  if
   i32.const 1040
   i32.const 1280
   i32.const 57
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 0
  call $~lib/rt/stub/__alloc
  local.tee $6
  local.get $3
  call $~lib/memory/memory.fill
  local.get $0
  i32.load
  drop
  local.get $0
  local.get $6
  i32.store
  local.get $0
  local.get $6
  i32.store offset=4
  local.get $0
  local.get $3
  i32.store offset=8
  local.get $0
  local.get $1
  i32.store offset=12
  loop $for-loop|0
   local.get $4
   local.get $5
   i32.lt_s
   if
    local.get $7
    local.get $4
    i32.const 12
    i32.mul
    i32.add
    local.tee $3
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $2
     local.tee $1
     i32.const 1
     i32.add
     local.set $2
     local.get $3
     i32.load
     local.set $3
     local.get $1
     local.get $0
     i32.load offset=12
     i32.ge_u
     if
      local.get $1
      i32.const 0
      i32.lt_s
      if
       i32.const 1440
       i32.const 1280
       i32.const 120
       i32.const 22
       call $~lib/builtins/abort
       unreachable
      end
      local.get $0
      local.get $1
      i32.const 1
      i32.add
      local.tee $6
      call $~lib/array/ensureSize
      local.get $0
      local.get $6
      i32.store offset=12
     end
     local.get $3
     local.get $0
     i32.load offset=4
     local.get $1
     i32.const 2
     i32.shl
     i32.add
     local.tee $1
     i32.load
     i32.ne
     if
      local.get $1
      local.get $3
      i32.store
     end
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $0
  i32.load offset=12
  local.tee $4
  local.get $2
  i32.gt_s
  if
   local.get $0
   i32.load offset=4
   local.tee $5
   local.get $2
   i32.const 2
   i32.shl
   i32.add
   local.set $1
   local.get $5
   local.get $4
   i32.const 2
   i32.shl
   i32.add
   local.set $4
   loop $do-continue|0
    local.get $1
    i32.load
    drop
    local.get $1
    i32.const 4
    i32.add
    local.tee $1
    local.get $4
    i32.lt_u
    br_if $do-continue|0
   end
  else
   local.get $0
   local.get $2
   call $~lib/array/ensureSize
  end
  local.get $0
  local.get $2
  i32.store offset=12
  local.get $0
 )
 (func $assembly/index/neighbors (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $2
  i32.const 0
  call $~lib/typedarray/Int8Array#__get
  local.set $7
  local.get $2
  i32.const 1
  call $~lib/typedarray/Int8Array#__get
  local.set $9
  i32.const 0
  i32.const 13
  i32.const 1680
  call $~lib/rt/__allocArray
  local.set $8
  local.get $1
  call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#keys
  local.set $6
  i32.const 1
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const -1
   i32.ge_s
   if
    i32.const 1
    local.set $5
    loop $for-loop|1
     local.get $5
     i32.const -1
     i32.ge_s
     if
      call $assembly/index/Point#constructor
      local.tee $3
      local.get $0
      i32.load
      local.get $1
      i32.sub
      i32.store
      local.get $3
      local.get $0
      i32.load offset=4
      local.get $5
      i32.sub
      i32.store offset=4
      block $for-continue|1
       local.get $3
       i32.load
       local.get $0
       i32.load
       i32.eq
       if (result i32)
        local.get $3
        i32.load offset=4
        local.get $0
        i32.load offset=4
        i32.eq
       else
        i32.const 0
       end
       br_if $for-continue|1
       local.get $3
       i32.load
       i32.const 0
       i32.lt_s
       if (result i32)
        i32.const 1
       else
        local.get $3
        i32.load
        local.get $7
        i32.ge_s
       end
       br_if $for-continue|1
       local.get $3
       i32.load offset=4
       i32.const 0
       i32.lt_s
       if (result i32)
        i32.const 1
       else
        local.get $3
        i32.load offset=4
        local.get $9
        i32.ge_s
       end
       br_if $for-continue|1
       block $__inlined_func$assembly/index/findPointInArray (result i32)
        i32.const 0
        local.set $4
        loop $for-loop|00
         local.get $4
         local.get $6
         i32.load offset=12
         i32.lt_s
         if
          i32.const 1
          local.get $6
          local.get $4
          call $~lib/array/Array<~lib/array/Array<i32>>#__get
          i32.load
          local.get $3
          i32.load
          i32.eq
          if (result i32)
           local.get $6
           local.get $4
           call $~lib/array/Array<~lib/array/Array<i32>>#__get
           i32.load offset=4
           local.get $3
           i32.load offset=4
           i32.eq
          else
           i32.const 0
          end
          br_if $__inlined_func$assembly/index/findPointInArray
          drop
          local.get $4
          i32.const 1
          i32.add
          local.set $4
          br $for-loop|00
         end
        end
        i32.const 0
       end
       br_if $for-continue|1
       local.get $2
       local.get $3
       i32.load offset=4
       local.get $7
       local.get $3
       i32.load
       i32.mul
       i32.add
       i32.const 2
       i32.add
       call $~lib/typedarray/Int8Array#__get
       br_if $for-continue|1
       local.get $8
       local.get $3
       call $~lib/array/Array<assembly/index/Point>#push
      end
      local.get $5
      i32.const 1
      i32.sub
      local.set $5
      br $for-loop|1
     end
    end
    local.get $1
    i32.const 1
    i32.sub
    local.set $1
    br $for-loop|0
   end
  end
  local.get $8
 )
 (func $assembly/index/findPath (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 f64)
  (local $13 f64)
  local.get $0
  local.set $5
  call $assembly/index/Point#constructor
  local.tee $6
  local.get $1
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.store
  local.get $6
  local.get $2
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.store offset=4
  call $assembly/index/Point#constructor
  local.tee $2
  local.get $3
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.store
  local.get $2
  local.get $4
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.store offset=4
  i32.const 8
  i32.const 12
  call $~lib/rt/stub/__alloc
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  f32.const 0
  f32.store offset=4
  i32.const 24
  i32.const 14
  call $~lib/rt/stub/__alloc
  local.tee $1
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $1
  i32.const 3
  i32.store offset=4
  local.get $1
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $0
  i32.load
  drop
  local.get $0
  local.get $1
  i32.store
  local.get $0
  f32.const 0
  f32.store offset=4
  i32.const 24
  i32.const 15
  call $~lib/rt/stub/__alloc
  local.tee $1
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $1
  i32.const 3
  i32.store offset=4
  local.get $1
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $1
  local.set $3
  i32.const 24
  i32.const 16
  call $~lib/rt/stub/__alloc
  local.tee $1
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $1
  i32.const 3
  i32.store offset=4
  local.get $1
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $0
  local.get $6
  f32.const 0
  call $assembly/index/ProrityQueue#push
  local.get $3
  local.get $6
  i32.const 0
  call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#set
  local.get $1
  local.tee $4
  local.get $6
  i32.const 0
  call $~lib/map/Map<assembly/index/Point,i32>#set
  loop $while-continue|0
   local.get $0
   i32.load
   i32.load offset=20
   if
    local.get $0
    call $assembly/index/ProrityQueue#pop
    local.tee $6
    if
     local.get $6
     i32.load
     local.get $2
     i32.load
     i32.eq
     if (result i32)
      local.get $6
      i32.load offset=4
      local.get $2
      i32.load offset=4
      i32.eq
     else
      i32.const 0
     end
     if
      local.get $3
      local.get $6
      call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#get
      local.set $1
      i32.const 1
      i32.const 19
      i32.const 0
      call $~lib/rt/__allocArray
      local.tee $0
      i32.load offset=4
      i32.const 2
      i32.const 17
      i32.const 0
      call $~lib/rt/__allocArray
      local.tee $4
      i32.load offset=4
      local.tee $5
      local.get $6
      i32.load
      i32.store
      local.get $5
      local.get $6
      i32.load offset=4
      i32.store offset=4
      local.get $4
      i32.store
      loop $while-continue|1
       local.get $1
       if
        i32.const 2
        i32.const 17
        i32.const 0
        call $~lib/rt/__allocArray
        local.tee $5
        i32.load offset=4
        local.tee $2
        local.get $1
        i32.load
        i32.store
        local.get $2
        local.get $1
        i32.load offset=4
        i32.store offset=4
        local.get $0
        local.get $0
        i32.load offset=12
        i32.const 1
        i32.add
        local.tee $2
        call $~lib/array/ensureSize
        local.get $0
        i32.load offset=4
        local.tee $4
        i32.const 4
        i32.add
        local.get $4
        local.get $2
        i32.const 1
        i32.sub
        i32.const 2
        i32.shl
        call $~lib/memory/memory.copy
        local.get $4
        local.get $5
        i32.store
        local.get $0
        local.get $2
        i32.store offset=12
        local.get $3
        local.get $1
        call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#get
        local.set $1
        br $while-continue|1
       end
      end
      local.get $0
      i32.load offset=12
      i32.const 1
      i32.shl
      call $~lib/typedarray/Int8Array#constructor
      local.set $1
      loop $for-loop|2
       local.get $7
       local.get $0
       i32.load offset=12
       i32.lt_s
       if
        local.get $0
        local.get $7
        call $~lib/array/Array<~lib/array/Array<i32>>#__get
        i32.const 0
        call $~lib/array/Array<i32>#__get
        local.set $2
        local.get $0
        local.get $7
        call $~lib/array/Array<~lib/array/Array<i32>>#__get
        i32.const 1
        call $~lib/array/Array<i32>#__get
        local.set $3
        local.get $1
        local.get $9
        local.get $2
        call $~lib/typedarray/Int8Array#__set
        local.get $1
        local.get $9
        i32.const 1
        i32.add
        local.get $3
        call $~lib/typedarray/Int8Array#__set
        local.get $9
        i32.const 2
        i32.add
        local.set $9
        local.get $7
        i32.const 1
        i32.add
        local.set $7
        br $for-loop|2
       end
      end
      local.get $1
      return
     end
     local.get $6
     local.get $3
     local.get $5
     call $assembly/index/neighbors
     local.set $11
     i32.const 0
     local.set $8
     loop $for-loop|3
      local.get $8
      local.get $11
      i32.load offset=12
      i32.lt_s
      if
       local.get $11
       local.get $8
       call $~lib/array/Array<~lib/array/Array<i32>>#__get
       local.set $1
       local.get $4
       local.get $6
       call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#get
       i32.const 1
       i32.add
       local.set $10
       local.get $4
       local.get $1
       local.get $1
       call $~lib/util/hash/hash32
       call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#find
       if (result i32)
        local.get $4
        local.get $1
        call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#get
        local.get $10
        i32.ge_s
       else
        i32.const 1
       end
       if
        local.get $4
        local.get $1
        local.get $10
        call $~lib/map/Map<assembly/index/Point,i32>#set
        local.get $0
        local.get $1
        local.get $10
        f32.convert_i32_s
        f64.const 1
        local.get $2
        i32.load
        local.get $1
        i32.load
        i32.sub
        f64.convert_i32_s
        f64.abs
        local.tee $12
        local.get $2
        i32.load offset=4
        local.get $1
        i32.load offset=4
        i32.sub
        f64.convert_i32_s
        f64.abs
        local.tee $13
        f64.lt
        if (result f64)
         f64.const 0.41421356237309515
         local.get $12
         f64.mul
         local.get $13
         f64.add
        else
         f64.const 0.41421356237309515
         local.get $13
         f64.mul
         local.get $12
         f64.add
        end
        f64.div
        f32.demote_f64
        f32.add
        call $assembly/index/ProrityQueue#push
        local.get $3
        local.get $1
        local.get $6
        call $~lib/map/Map<assembly/index/Point,assembly/index/Point | null>#set
       end
       local.get $8
       i32.const 1
       i32.add
       local.set $8
       br $for-loop|3
      end
     end
     br $while-continue|0
    end
   end
  end
  i32.const 0
  call $~lib/typedarray/Int8Array#constructor
 )
 (func $~start
  i32.const 1856
  global.set $~lib/rt/stub/startOffset
  i32.const 1856
  global.set $~lib/rt/stub/offset
 )
)
