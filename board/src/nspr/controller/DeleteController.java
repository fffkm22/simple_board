package nspr.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nspr.config.MyBatisConnectionProvider;
import nspr.model.Post;

@Controller
public class DeleteController {

	@GetMapping("/delete")
	public String getDdelete(@RequestParam(name = "no") int no, HttpServletRequest req) {
		try {
			SqlSession session = MyBatisConnectionProvider.getSession();
			Post post = session.selectOne("nspr.mapper.PostMapper.selectPostByNum", no);
			String pw = post.getPost_password();
			req.setAttribute("password", pw);
			session.close();
			
			return "delete";
		} catch (Exception e) {
			return "error";
		}
	}

	@PostMapping("/delete")
	public String postDdelete(@RequestParam(name = "no") int no, HttpServletRequest req) {

		SqlSession session = MyBatisConnectionProvider.getSession();
		session.delete("deleteByNum", no);
		session.commit();
		session.close();

		return "redirect:/";
	}

}
