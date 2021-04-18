List<String> names = new List<String>();
names.add('foo');
names.add('bar');
System.debug('names: ' + names);
// names: (foo, bar)

Set<Integer> primes = new Set<Integer>();
primes.add(2);
primes.add(3);
primes.add(3);
System.debug('primes: ' + primes);
// primes: {2, 3}