/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entities.Oders;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Serhii Bielik
 */
@Stateless
public class OdersFacade extends AbstractFacade<Oders> {

    @PersistenceContext(unitName = "MoviesShopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OdersFacade() {
        super(Oders.class);
    }
    
}
