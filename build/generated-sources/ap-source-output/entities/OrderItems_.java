package entities;

import entities.Movies;
import entities.Oders;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-17T23:04:05")
@StaticMetamodel(OrderItems.class)
public class OrderItems_ { 

    public static volatile SingularAttribute<OrderItems, Integer> quantity;
    public static volatile SingularAttribute<OrderItems, Oders> orderId;
    public static volatile SingularAttribute<OrderItems, Movies> movieId;
    public static volatile SingularAttribute<OrderItems, Integer> id;

}