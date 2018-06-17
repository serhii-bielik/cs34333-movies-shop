/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entities.Movies;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Serhii Bielik
 */
@Stateless
public class MoviesFacade extends AbstractFacade<Movies> {

    @PersistenceContext(unitName = "MoviesShopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MoviesFacade() {
        super(Movies.class);
    }
    
}
