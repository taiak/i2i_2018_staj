import java.util.*;
/**
 *  @inv isEmpty() implies elements.size() == 0
 */
public class StackImpl implements Stack
{
    private final LinkedList elements = new LinkedList();
    public void push(Object o)
    {
        elements.add(o);
    }
    public Object pop()
    {
        final Object popped = top();
        elements.removeLast();
        return popped;
    }
    public Object top()
    {
        return elements.getLast();
    }
    public boolean isEmpty()
    {
        return elements.size() == 0;
    }
}