package com.example.shoponline.Entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "categories")

public class Category {
    private static final String SEQ_Name ="category_seq";

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator =  SEQ_Name)
    @SequenceGenerator(name= SEQ_Name, sequenceName = SEQ_Name, allocationSize = 1)
    private Long id;

    private String title;
}

