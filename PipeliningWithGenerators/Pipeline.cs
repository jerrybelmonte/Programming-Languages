// Pipelining with generators.
using System;


class Pipeline 
{
    public static IEnumerable<int> Generate() 
    {
        for (int i = 0; i < 10; ++i)
            yield return i;
    }

    public static IEnumerable<int> Square(IEnumerable<int> seq) 
    {
        foreach (var k in seq)
            yield return k * k;
    }

    public static IEnumerable<int> SquareLINQ(IEnumerable<int> seq)
        => from k in seq select k * k;

    static int Sum(IEnumerable<int> seq) 
    {
        int s = 0;

        foreach (var k in seq)
            s += k;
        
        return s;
    }

    static void Main() 
    {
        Sum(Square(Generate())).Dump();
        Sum(SquareLINQ(Generate())).Dump();
    }
}