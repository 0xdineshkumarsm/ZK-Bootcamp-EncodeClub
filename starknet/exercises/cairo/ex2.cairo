
from starkware.cairo.common.uint256 import Uint256,uint256_add

// Modify both functions so that they increment
// supplied value and return it
func add_one(y: felt) -> (val: felt) {
    return (y+1,);
}

func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    // return (y,);
    let (res: Uint256,_)  = uint256_add(y,Uint256(1,0));
    return (res,);
}
