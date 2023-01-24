package com.epam.esm.domain.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

/**
 * Represents relevant entity from database's table
 *
 * @author Oleksadr Koreshev
 * @since 1.0
 */

@Data
@EqualsAndHashCode(callSuper = false)
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "certificates")
public class Certificate extends AbstractEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name", unique = true)
    private String name;

    @Column(name = "description", unique = true)
    private String description;

    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "duration")
    private Integer duration;

    @Column(name = "create_date", columnDefinition="TIMESTAMP(9)")
//    @CreationTimestamp
    private LocalDateTime createDate;

    @Column(name = "last_update_date", columnDefinition="TIMESTAMP(9)")
//    @CreationTimestamp
    private LocalDateTime lastUpdateDate;

    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    @ManyToMany(cascade = {
            CascadeType.PERSIST,
            CascadeType.MERGE})
    @JoinTable(name = "certificates_tags",
            joinColumns = @JoinColumn(name = "certificate_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id")
    )
    private Set<Tag> tags = new HashSet<>();

    public Certificate(Long id,
                       String name,
                       String description,
                       BigDecimal price,
                       Integer duration,
                       LocalDateTime createDate,
                       LocalDateTime lastUpdateDate) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.duration = duration;
        this.createDate = createDate;
        this.lastUpdateDate = lastUpdateDate;
    }

    public void addTags(Set<Tag> tags) {
        this.tags.addAll(tags);
    }

    @PrePersist
    protected void onCreate() {
        this.createDate = LocalDateTime.now();
        this.lastUpdateDate = createDate;
    }

    @PreUpdate
    protected void onUpdate() {
        this.lastUpdateDate = LocalDateTime.now();
    }
}



