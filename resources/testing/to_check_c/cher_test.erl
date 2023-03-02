% Performs a rank-1 update of a complex Hermitian matrix.

-module(cher_test).
-include_lib("eunit/include/eunit.hrl").

cher_test()->
    N = 3,
    X = blas:new(chain:ltb(s, [1.0, 2.0, 3.0])),
    A = blas:new(chain:ltb(s, [1.0, 2.0, 3.0, 2.0, 4.0, 5.0, 3.0, 5.0, 6.0])),
    blas:run({cher, blasRowMajor, blasUpper, N, 2.0, X, 1, A, N}),
    [29, 30, 31, 30, 32, 33, 31, 33, 34] =:= chain:btl(s, blas:to_bin(A)).