#!/usr/bin/env python2
# factor_list.py
# 
# Get the prime factors of a list of integers supplied in an input file

import numpy as np
import argparse
import math

############################################
# Returns a list of the prime factors of n 
############################################
def primeFactors(n): 
    
    # list of factors 
    factors = [] 

    # number of 2's that divide n 
    while n % 2 == 0: 
        factors.append(2) 
        n = n / 2
          
    # n is now odd so we can exclude even i  
    for i in range(3,int(math.sqrt(n))+1,2): 
          
        # number time n is divisible by i
        while n % i== 0: 
            factors.append(i)
            n = n / i 
              
    # Last prime factor of n 
    if n > 2: 
        factors.append(n)

    return factors
############################################

# -----------------------------------------------------------------------------
# Begin Main Program 
# -----------------------------------------------------------------------------
def main():

    # Parse command line arguments
    parser = argparse.ArgumentParser(
                        description='Get the prime factors of a list of integers.')
    parser.add_argument('filename', help='input filename')
    parser.add_argument('-o', '--out', help='out filename')
    parser.add_argument('-N', type=int, default=1, help='number of segments')
    parser.add_argument('-i', type=int, default=0, help='segment index')
    args = parser.parse_args()

    # Check paramters
    assert (args.i < args.N) and (args.i >= 0), "Invalid i: 0 <= i < N"

    # Load the list of number from filename
    numbers = np.loadtxt(args.filename, dtype=np.uint64).tolist()
    if type(numbers) is not list:
        numbers = [numbers] 
    length_list= len(numbers)

    # Determine segment limits
    if args.N < 2:
        s_min = 0
        s_max = length_list - 1
    else:
        delta_s = int(np.round(length_list/float(args.N)))
        s_min = delta_s * args.i
        if args.i == args.N - 1:
            s_max = length_list - 1
        else:
            s_max = s_min + delta_s - 1

    # Open output file
    if args.out is not None:
        out_file = open(args.out ,'w')
    
    # Factor the numbers
    for number in numbers[s_min:s_max+1]:
        factors = primeFactors(number)    

        # Write factors to disk
        if args.out is not None:
            np.savetxt(out_file, 
                       np.resize(np.array(factors, dtype=np.uint64),
                       (1, len(factors))), fmt='%i')
        else:
            print (np.array(factors, dtype=int)).tolist()
    
    # Close output file 
    if args.out is not None:
        out_file.close()
         
# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
if __name__ == "__main__":
    main()

