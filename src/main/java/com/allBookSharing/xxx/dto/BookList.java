package com.allBookSharing.xxx.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Alias("booklist")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain=true)
public class BookList {
	private List<Books> bookList;
}
