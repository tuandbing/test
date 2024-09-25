package com.ssm.pojo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Getter
@Setter
public class User {

    private Integer id;

    private String name;

    private String password;

    private String age;

    private String address;

}
