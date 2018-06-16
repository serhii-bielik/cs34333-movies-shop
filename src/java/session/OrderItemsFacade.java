/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entities.OrderItems;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author WD
 */
@Stateless
public class OrderItemsFacade extends AbstractFacade<OrderItems> {

    @PersistenceContext(unitName = "MoviesShopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderItemsFacade() {
        super(OrderItems.class);
    }
    
}