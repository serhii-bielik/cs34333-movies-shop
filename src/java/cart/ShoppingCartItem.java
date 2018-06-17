/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cart;

import entities.Movies;

/**
 *
 * @author tgiunipero
 */
public class ShoppingCartItem {

    Movies product;
    short quantity;

    public ShoppingCartItem(Movies product) {
        this.product = product;
        quantity = 1;
    }

    public Movies getProduct() {
        return product;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    public void incrementQuantity() {
        quantity++;
    }

    public void decrementQuantity() {
        quantity--;
    }

    public double getTotal() {
        double amount = 0;
        amount = (this.getQuantity() * product.getPrice().doubleValue());
        return amount;
    }

}