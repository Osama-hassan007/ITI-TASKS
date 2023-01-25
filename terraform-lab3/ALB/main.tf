resource "aws_lb" "for-pub" {
  name            = var.name-alb-pub
  internal        = false
  load_balancer_type = "application"
  security_groups    = var.sec-gr-pub-alp
  subnets            = var.pub-subnets

}

resource "aws_lb_target_group" "pub-tg" {
  name     = var.tg-name-pub
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id_for-tg
}

resource "aws_lb_target_group_attachment" "attach-proxy1" {
  target_group_arn = aws_lb_target_group.pub-tg.arn
  target_id        = var.proxy1-id
  port             = "80"
}
resource "aws_lb_target_group_attachment" "attach-proxy2" {
  target_group_arn = aws_lb_target_group.pub-tg.arn
  target_id        = var.proxy2-id
  port             = "80"
}

resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.for-pub.arn
  protocol          = "HTTP"
  port              = "80"
  default_action {
    target_group_arn = aws_lb_target_group.pub-tg.arn
    type             = "forward"
  }
}
# --------------------------------------------------------------------------------------
resource "aws_lb" "for-private" {
  name            = var.name-alb-private
  internal        = true
  load_balancer_type = "application"
  security_groups    = var.sec-gr-private-alp
  subnets            = var.private-subnets

}

resource "aws_lb_target_group" "private-tg" {
  name     = var.tg-name-private
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id_for-tg
}

resource "aws_lb_target_group_attachment" "attach-apache1" {
  target_group_arn = aws_lb_target_group.private-tg.arn
  target_id        = var.apache1-id
  port             = "80"
}
resource "aws_lb_target_group_attachment" "attach-apache2" {
  target_group_arn = aws_lb_target_group.private-tg.arn
  target_id        = var.apache2-id
  port             = "80"
}

resource "aws_lb_listener" "example1" {
  load_balancer_arn = aws_lb.for-private.arn
  protocol          = "HTTP"
  port              = "80"
  default_action {
    target_group_arn = aws_lb_target_group.private-tg.arn
    type             = "forward"
  }
}


