package nspr.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nspr.config.MyBatisConnectionProvider;
import nspr.model.PageNumber;
import nspr.model.Post;

@Controller
public class IndexController {

	@GetMapping("/")
	public String index(HttpServletRequest req) {
		try {
			int currnetP = 1;
			try {
				currnetP = Integer.valueOf(req.getParameter("page"));
			} catch (NumberFormatException e) {
			}
			int post10 = (currnetP - 1) * 10;

			SqlSession sessionP = MyBatisConnectionProvider.getSession();
			PageNumber pageN = sessionP.selectOne("nspr.mapper.PostMapper.selectCount");
			int lp = pageN.calLastPage();
			req.setAttribute("lastP", lp);
			sessionP.close();

			SqlSession session = MyBatisConnectionProvider.getSession();
			List<Post> list = session.selectList("nspr.mapper.PostMapper.selectLast10", post10);
			req.setAttribute("list", list);
			session.close();
			return "list";
		} catch (Exception e) {
			return "error";
		}

	}

	@GetMapping("/re")
	public String redi(HttpServletRequest req) {

		return "redirect:/";
	}

	@PostMapping("/")
	public String postIndex(HttpServletRequest req) {
		String cont = req.getParameter("cont");

		Post newPost = new Post(req.getParameter("title"), req.getParameter("writer"), req.getParameter("password"),
				cont.replace("\n", "<br>"), new Timestamp(System.currentTimeMillis()));
		SqlSession session = MyBatisConnectionProvider.getSession();
		session.insert("nspr.mapper.PostMapper.insertPost", newPost);
		session.commit();

//		List<Post> list = session.selectList("nspr.mapper.PostMapper.selectLast10");
//		req.setAttribute("list", list);
//		session.close();

		return "redirect:/";
	}

	@PostMapping("/put")
	public String putIndex(@RequestParam(name = "no") int no, HttpServletRequest req) {
		String cont = req.getParameter("cont");

		Post editPost = new Post(no, req.getParameter("title"), req.getParameter("writer"),
				req.getParameter("password"), cont.replace("\n", "<br>"), new Timestamp(System.currentTimeMillis()));
		SqlSession session = MyBatisConnectionProvider.getSession();
		session.update("updatePost", editPost);
		session.commit();
		session.close();

		return "redirect:/";
	}
}
