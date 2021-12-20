package mycart.Model;

import javax.persistence.*;

@Entity
public class Balance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int balanceId;
    private int availBalance;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Balance(int availBalance, User user) {
        this.availBalance = availBalance;
        this.user = user;
    }

    public Balance() {

    }

    public int getBalanceId() {
        return balanceId;
    }

    public void setBalanceId(int balanceId) {
        this.balanceId = balanceId;
    }

    public int getAvailBalance() {
        return availBalance;
    }

    public void setAvailBalance(int availBalance) {
        this.availBalance = availBalance;
    }
}
