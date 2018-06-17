/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entities.Users;
import java.security.NoSuchAlgorithmException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Serhii Bielik
 */
@Stateless
public class UsersFacade extends AbstractFacade<Users> {

    @PersistenceContext(unitName = "MoviesShopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }
    
    public Users login(String email, String pwd) {
        try {
            pwd = MD5(pwd);
            Users user = (Users) em.createNamedQuery("Users.login").setParameter("email", email).setParameter("password", pwd).getSingleResult();
            return user;
        } catch (Exception x) {
            return null;
        }
    }
    
    public boolean isExists(String email, String username) {
        try {
            int count = em.createNamedQuery("Users.isExists").setParameter("email", email).setParameter("username", username).getResultList().size();
            if (count > 0) {
                return true;
            }
        } catch (Exception x) {
            
        }
        return false;
    }

    public Users prepareUser(String email, String username, String pwd) {
        try {
            Users u = new Users();
            u.setEmail(email);
            u.setUsername(username);
            u.setPassword(MD5(pwd));
            return u;
        } catch (Exception x) {
            return null;
        }
    }

    private String MD5(String str) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(str.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
        }
        return null;
    }
    
}
