package ru.zzzadruga.model;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "note")
@Table(name = "note")
@EqualsAndHashCode(of = "id")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@DynamicUpdate
@DynamicInsert
@SelectBeforeUpdate
@ToString
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String title;
    private String text;
    private Date createdDate;
    private boolean done;
}
