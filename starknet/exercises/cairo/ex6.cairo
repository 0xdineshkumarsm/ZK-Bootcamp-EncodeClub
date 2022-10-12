

from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    alloc_locals;
    if (idx == arr_len){
        return (0,);
    }
    // tempvar test;
    let (is_odd) = bitwise_and(arr[idx],1);
    let current_el = ( 1 - is_odd) * arr[idx];
    %{print("loop",ids.idx,ids.current_el)%}
    let (remaining_even_sum) = sum_even(arr_len,arr,run,idx+1);
    return (current_el+remaining_even_sum,);
}
