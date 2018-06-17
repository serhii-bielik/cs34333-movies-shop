package entities;

import entities.Oders;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-17T23:04:05")
@StaticMetamodel(OrderStatuses.class)
public class OrderStatuses_ { 

    public static volatile CollectionAttribute<OrderStatuses, Oders> odersCollection;
    public static volatile SingularAttribute<OrderStatuses, Integer> id;
    public static volatile SingularAttribute<OrderStatuses, String> title;

}