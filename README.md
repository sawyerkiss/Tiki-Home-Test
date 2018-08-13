### Home test for Candidate

#### Ứng dụng từ khoá hot
Mô tả màn hình chính của ứng dụng từ khoá hot sẽ gồm có 3 chức năng chính được thể hiện trên cùng 1 màn hình
#### Tìm kiếm
UI phần tìm kiếm sẽ có 1 search bar để người dùng nhập từ khoá để tìm kiếm, sau khi người dùng nhấn search với từ khoá khác rỗng thì từ khoá vừa được tìm kiếm sẽ được lưu lại và hiển thị ở phần **Lịch sử tìm kiếm**
#### Từ khoá hot
![Hot-Keyword-Photo.png](http://sv1.upsieutoc.com/2018/08/12/Hot-Keyword-Photo.png)

Dữ liệu từ khoá hot được lấy về từ [https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios/keywords.json](https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios/keywords.json)
1 từ khoá hot sẽ có nội dung và hình ảnh được thể hiện giống như UI:

	- Padding 2 bên 16px.
	- Font size 14px.
Lưu ý phần hiển thị nội dung từ khoá có 3 rules sau:

	- Nếu nội dung chỉ có 1 từ thì sẽ hiển thị 1 dòng
	- Nếu nội dung có nhiều hơn 1 từ thì sẽ hiển thị 2 dòng. Nội dung được align center. Cần tính toán chiều rộng của vùng hiển thị nội dung sao cho chiều rộng đó là nhỏ nhất.
	- Background color của phần nội dung được lấy theo thứ tự  #16702e, #005a51, #996c00, #5c0a6b, #006d90, #974e06, #99272e, #89221f, #00345d.

#### Lịch sử tìm kiếm

[![Hot-Keyword4e3db7410dd7febf.png](http://sv1.upsieutoc.com/2018/08/12/Hot-Keyword4e3db7410dd7febf.png)](http://www.upsieutoc.com/image/4Vk3k0)

Hiển thị lịch sử tìm kiếm của người dùng. Danh sách lịch sử được sắp xếp theo thời gian tìm kiếm, từ được tìm kiếm gần nhất ở đầu. Nếu 2 từ khoá giống nhau thì chỉ hiển thị từ được tìm ở lần gần nhất.
Nếu như chưa có lịch sử tìm kiếm thì sẽ không hiển thị phần UI này. Chức năng xoá tất cả sẽ xoá tất cả lịch sử tìm kiếm của người dùng.
Phần nội dung của từ khoá được hiển thị giống như phần nội dung của từ khoá hot ở trên.


### Yêu cầu:

	- Ứng dụng được viết bằng Swift 4 trên Xcode 9.4
	- Ứng viên làm bài và gửi lại link github của project.
	- UI đẹp và Unit Test là điểm cộng thêm.
