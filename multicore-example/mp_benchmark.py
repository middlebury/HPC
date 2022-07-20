"""
Testing python multiprocessing speed. Based on
http://willtownes.github.io/mp_benchmark.py
http://blogs.warwick.ac.uk/dwatkins/entry/benchmarking_parallel_python_1_2/
"""

import argparse
import time
import math
import multiprocessing as mp


def isprime(n):
	"""Returns True if n is prime and False otherwise"""
	if not isinstance(n, int):
		raise TypeError("argument passed to is_prime is not of 'int' type")
	if n < 2:
		return False
	if n == 2:
		return True
	max = int(math.ceil(math.sqrt(n)))
	i = 2
	while i <= max:
		if n % i == 0:
			return False
		i += 1
	return True


def sum_primes(n):
	"""Calculates sum of all primes below given integer n"""
	return sum([x for x in range(2,n) if isprime(x)])


if __name__=="__main__":
	
	# Parse command line arguments
	parser = argparse.ArgumentParser(
						description='Use multithreading to compute sums of primes.')
	parser.add_argument('n_threads', help='number of threads', type=int)
	args = parser.parse_args()
	n_threads = args.n_threads
	
	inputs = range(100000, 1000000, 100000)
	pool = mp.Pool(n_threads)

	print("\nProcessing with %d cores"%n_threads, flush=True)
	start_time = time.time()
	jobs = zip(inputs, pool.map(sum_primes,inputs))
	for input, job in jobs:
		print( f'Sum of primes below {input} = {job}')
	
	print("Time elapsed: ", time.time() - start_time, "s\n")

