package entities;

import entities.Categories;
import entities.OrderItems;
import entities.Reviews;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-17T23:04:05")
@StaticMetamodel(Movies.class)
public class Movies_ { 

    public static volatile SingularAttribute<Movies, BigDecimal> price;
    public static volatile SingularAttribute<Movies, BigDecimal> rating;
    public static volatile SingularAttribute<Movies, String> description;
    public static volatile CollectionAttribute<Movies, OrderItems> orderItemsCollection;
    public static volatile SingularAttribute<Movies, Integer> id;
    public static volatile SingularAttribute<Movies, String> title;
    public static volatile CollectionAttribute<Movies, Reviews> reviewsCollection;
    public static volatile SingularAttribute<Movies, String> poster;
    public static volatile SingularAttribute<Movies, Categories> categoryId;

}