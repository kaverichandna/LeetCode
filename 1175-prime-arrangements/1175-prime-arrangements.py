class Solution:
    def numPrimeArrangements(self, n):
        def isPrime(y):
            if y <= 1:
                return False
            for i in range(2, int(y ** 0.5) + 1):
                if y % i == 0:
                    return False
            return True
        
        c = 0
        for i in range(1, n + 1):
            if isPrime(i):
                c += 1
        
        def factorial(x):
            f = 1
            for num in range(1, x + 1):
                f = (f * num) % (10**9 + 7)
            return f
        
        prime_count = c
        non_prime_count = n - c
        
        result = (factorial(prime_count) * factorial(non_prime_count)) % (10**9 + 7)
        return result

# Test
solution = Solution()
print(solution.numPrimeArrangements(5))  # Output: 12
print(solution.numPrimeArrangements(100))  # Output: 682289015
