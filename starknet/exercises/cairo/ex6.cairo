// I AM NOT DONE

from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    if (idx == arr_len){
        return (0,);
    }
    // tempvar test;
    let (is_odd) = bitwise_and(arr[idx],1);
    let (is_odd2) = bitwise_xor(is_odd,1);
    let current_el = is_odd2 * arr[idx];
    %{print("loop",ids.idx,ids.current_el)%}
    let (remaining_even_sum) = sum_even(arr_len,arr,run,idx+1);
    // let remaining_even_sum = 1;
    // %{print("hello",ids.current_el,ids.remaining_even_sum)%}
    return (current_el+remaining_even_sum,);
}
