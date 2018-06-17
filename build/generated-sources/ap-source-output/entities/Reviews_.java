package entities;

import entities.Movies;
import entities.Users;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-17T23:04:05")
@StaticMetamodel(Reviews.class)
public class Reviews_ { 

    public static volatile SingularAttribute<Reviews, BigDecimal> rating;
    public static volatile SingularAttribute<Reviews, Movies> movieId;
    public static volatile SingularAttribute<Reviews, Integer> id;
    public static volatile SingularAttribute<Reviews, String> title;
    public static volatile SingularAttribute<Reviews, String> body;
    public static volatile SingularAttribute<Reviews, Boolean> isApproved;
    public static volatile SingularAttribute<Reviews, Users> userId;

}