//
//  Help Outline.swift
//  Year Long Project
//
//  Created by Juliana Nielson on 3/20/23.
//

/*
 - Replace with a TableViewController (or add a tableview)
 - Work on custom cell (PostCell)
     - Add custom elements to the custom cell
     - Auto Layout to custom cell
     - subclass file for `PostCell.swift`
 - Cell for comments (CommentCell)
     - CommentCell.swift
     - IBOutlets
     - func update(with comment: Comment)
  - Write 10 real posts - Very real
     - Post struct
     - Put it in its own file
     - Comment struct
  - Tableview Datasource
     - One section for each Post (10)
     - (pre comments) 1 row for each section (PostCell)
     - (post comments) comments.count + 1
     - cellForRowAt (indexPath)
         - 0 rows - PostCell
         - n+1 rows - CommentCell
 */
