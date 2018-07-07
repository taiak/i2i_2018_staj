/**
 *  @inv !isEmpty() implies top() != null   //  no null objects are allowed
 */
public interface Stack
{
    /**
     *  @pre o != null   // object must have space
     *  @post !isEmpty() 
     *  @post top() == o 
     */
    void push(Object o);
    
    /**
     *  @pre !isEmpty() 
     *  @post @return == top()@pre
     */
    Object pop();

    /**
     *  @pre !isEmpty() //stack must't be empty
     */
    Object top();

    boolean isEmpty();
}