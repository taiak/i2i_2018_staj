public  class StackTest
{
    public static void main(String[] args)
    {
        final Stack s = new StackImpl();
        s.push("one");
        s.pop();
        s.push("two");
        s.push("three");
        s.pop();
        s.pop();
        s.pop();    //  causes an assertion to fail
    }
}