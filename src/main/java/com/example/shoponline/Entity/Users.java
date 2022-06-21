package com.example.shoponline.Entity;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "users")
public class Users {

    private static final String SEQ_NAME ="user_seq";
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator =  SEQ_NAME)
    @SequenceGenerator(name= SEQ_NAME, sequenceName = SEQ_NAME, allocationSize = 1)
    private Long id;

    private String name;
    private String password;
    private String email;
    private boolean archive;

    @Enumerated(EnumType.STRING)
    private Role role;

    public enum Role {
        ADMIN, USER, MANAGER
    }
}

