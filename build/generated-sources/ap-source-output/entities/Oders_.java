package entities;

import entities.OrderItems;
import entities.OrderStatuses;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-17T23:04:05")
@StaticMetamodel(Oders.class)
public class Oders_ { 

    public static volatile SingularAttribute<Oders, OrderStatuses> statusId;
    public static volatile SingularAttribute<Oders, BigDecimal> price;
    public static volatile CollectionAttribute<Oders, OrderItems> orderItemsCollection;
    public static volatile SingularAttribute<Oders, Integer> id;
    public static volatile SingularAttribute<Oders, Date> orderDate;

}