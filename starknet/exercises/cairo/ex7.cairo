// I AM NOT DONE

%lang starknet
from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import unsigned_div_rem

// Using binary operations return:
// - 1 when pattern of bits is 01010101 from LSB up to MSB 1, but accounts for trailing zeros
// - 0 otherwise

// 000000101010101 PASS
// 010101010101011 FAIL

func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(
    n: felt, idx: felt, exp: felt, broken_chain: felt
) -> (true: felt) {

    alloc_locals;

    %{
        if ids.idx == 0:
            print("================================================================================= ",ids.n) 
    %}

    // if (broken_chain == 1){
    //     return(0,);
    // }

    if (exp == 0 ){
        let (q,r) = unsigned_div_rem(n,2);
        %{print("idx,exp,n,q,r",ids.idx,ids.exp,ids.n,ids.q,ids.r)%}
        if(r == 0) {
            let (res1) = pattern(q,idx+1,exp,broken_chain);
            return (res1,);
        }
        let (res1) = pattern(q,idx+1,1,broken_chain);
        return (res1,);
    }

    let (q,r) = unsigned_div_rem(n,4);
    %{print("-------------------------------exp == 1 => idx,exp,n,q,r",ids.idx,ids.exp,ids.n,ids.q,ids.r)%}
    if(n == 0 ){
        return (1,);
    }
    if(r != 2 ){
        return (0,);
    }
    let (res1) = pattern(q,idx+1,1,broken_chain);

    return (res1,);
}
