@extends('layouts.dashboard.app')

@section('content')


    <div class="content-wrapper">
        <section class="content-header">

            <h1>@lang('site.profile')</h1>

            <!-- <ol>
                <li><i class="fa fa-dashboard"></i>@lang('site.profile')</li>
                <li class="active"><i class="fa fa-dashboard"></i>@lang('site.users')</li>
            </ol> -->
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-dashboard"></i>@lang('site.profile')</li>
                <li><a href="{{route('dashboard.users.index')}}">@lang('site.users')</a></li>
            </ol>

        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-9">
                        <div class="nav-tabs-custom">
                          <ul class="nav nav-tabs">
                            <li class="active"><a href="#activity" data-toggle="tab">@lang('site.activity')</a></li>
                            <li><a href="#loginsprocc" data-toggle="tab">@lang('site.login_proccess')</a></li>
                            <li><a href="#settings" data-toggle="tab">@lang('site.settings')</a></li>
                          </ul>
                          <div class="tab-content">
                            <div class="tab-pane" id="loginsprocc">
                              <!-- Post -->
                              <div class="post">
                                <div class="user-block">
                                  <img class="img-circle img-bordered-sm" src="{{ asset('dashboard/img/user.png') }}" alt="user image">
                                      <span class="username">
                                        <a href="#">Jonathan Burke Jr.</a>
                                      </span>
                                  <span class="description">Shared publicly - 7:30 PM today</span>
                                </div>
                                <!-- /.user-block -->
                                <p>
                                  Lorem ipsum represents a long-held tradition for designers,
                                  typographers and the like. Some people hate it and argue for
                                  its demise, but others ignore the hate as they create awesome
                                  tools to help create filler text for everyone from bacon lovers
                                  to Charlie Sheen fans.
                                </p>


                              </div>
                              <!-- /.post -->

                              <!-- Post -->
                              <div class="post clearfix">
                                <div class="user-block">
                                  <img class="img-circle img-bordered-sm" src="{{ asset('dashboard/img/user.png') }}" alt="User Image">
                                      <span class="username">
                                        <a href="#">Sarah Ross</a>
                                      </span>
                                  <span class="description">Sent you a message - 3 days ago</span>
                                </div>
                                <!-- /.user-block -->
                                <p>
                                  Lorem ipsum represents a long-held tradition for designers,
                                  typographers and the like. Some people hate it and argue for
                                  its demise, but others ignore the hate as they create awesome
                                  tools to help create filler text for everyone from bacon lovers
                                  to Charlie Sheen fans.
                                </p>


                              </div>
                              <!-- /.post -->

                              <!-- Post -->
                              <div class="post">
                                <div class="user-block">
                                  <img class="img-circle img-bordered-sm" src="{{ asset('dashboard/img/user.png') }}" alt="User Image">
                                      <span class="username">
                                        <a href="#">Adam Jones</a>
                                      </span>
                                  <span class="description">Posted 5 photos - 5 days ago</span>
                                </div>
                                <!-- /.user-block -->
                                <div class="row margin-bottom">
                                  <div class="col-sm-6">
                                    <img class="img-responsive" src="../../dist/img/photo1.png" alt="Photo">
                                  </div>
                                  <!-- /.col -->
                                  <div class="col-sm-6">
                                    <div class="row">
                                      <div class="col-sm-6">
                                        <img class="img-responsive" src="../../dist/img/photo2.png" alt="Photo">
                                        <br>
                                        <img class="img-responsive" src="../../dist/img/photo3.jpg" alt="Photo">
                                      </div>
                                      <!-- /.col -->
                                      <div class="col-sm-6">
                                        <img class="img-responsive" src="../../dist/img/photo4.jpg" alt="Photo">
                                        <br>
                                        <img class="img-responsive" src="../../dist/img/photo1.png" alt="Photo">
                                      </div>
                                      <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                  </div>
                                  <!-- /.col -->
                                </div>
                                <!-- /.row -->



                              </div>
                              <!-- /.post -->
                            </div>
                            <!-- /.tab-pane -->
                            <div class="active tab-pane" id="activity">
                              <!-- The timeline -->
                              <ul class="timeline timeline-inverse">
                                <!-- timeline time label -->
                                <li class="time-label">
                                      <span class="bg-red">
                                        10 Feb. 2014
                                      </span>
                                </li>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <li>
                                  <i class="fa fa-envelope bg-blue"></i>

                                  <div class="timeline-item">
                                    <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                                    <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                                    <div class="timeline-body">
                                      Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                                      weebly ning heekya handango imeem plugg dopplr jibjab, movity
                                      jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                                      quora plaxo ideeli hulu weebly balihoo...
                                    </div>

                                  </div>
                                </li>
                                <!-- END timeline item -->
                                <!-- timeline item -->
                                <li>
                                  <i class="fa fa-user bg-aqua"></i>

                                  <div class="timeline-item">
                                    <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                                    <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request
                                    </h3>
                                  </div>
                                </li>
                                <!-- END timeline item -->
                                <!-- timeline item -->
                                <li>
                                  <i class="fa fa-comments bg-yellow"></i>

                                  <div class="timeline-item">
                                    <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                                    <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                                    <div class="timeline-body">
                                      Take me to your leader!
                                      Switzerland is small and neutral!
                                      We are more like Germany, ambitious and misunderstood!
                                    </div>

                                  </div>
                                </li>
                                <!-- END timeline item -->
                                <!-- timeline time label -->
                                <li class="time-label">
                                      <span class="bg-green">
                                        3 Jan. 2014
                                      </span>
                                </li>
                                <!-- /.timeline-label -->
                                <!-- timeline item -->
                                <li>
                                  <i class="fa fa-camera bg-purple"></i>

                                  <div class="timeline-item">
                                    <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                                    <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                                    <div class="timeline-body">
                                      <img src="http://placehold.it/150x100" alt="..." class="margin">
                                      <img src="http://placehold.it/150x100" alt="..." class="margin">
                                      <img src="http://placehold.it/150x100" alt="..." class="margin">
                                      <img src="http://placehold.it/150x100" alt="..." class="margin">
                                    </div>
                                  </div>
                                </li>
                                <!-- END timeline item -->
                                <li>
                                  <i class="fa fa-clock-o bg-gray"></i>
                                </li>
                              </ul>
                            </div>
                            <!-- /.tab-pane -->

                            <div class="tab-pane" id="settings">
                              <form class="form-horizontal">
                                  <div class="box">
                                      <div class="box-body">
                                        <div class="form-group">
                                            <label>@lang('site.name') </label>
                                            <input type="text" name="name" class="form-control" value="{{auth()->user()->name}}">
                                        </div>

                                        <div class="form-group">
                                            <div>
                                              <button type="submit" class="btn btn-primary btn-block">@lang('site.send')</button>
                                            </div>
                                          </div>
                                      </div>
                                  </div>


                              </form>
                            </div>
                            <!-- /.tab-pane -->
                          </div>
                          <!-- /.tab-content -->
                        </div>
                        <!-- /.nav-tabs-custom -->
                      </div>
                      <!-- /.col -->

                  <div class="col-md-3">

                    <!-- Profile Image -->
                    <div class="box box-primary card-outline">
                      <div class="box-body box-profile">
                        <div class="text-center">
                          <img class="profile-user-img img-fluid img-circle"
                               src="{{ asset('dashboard/img/user.png') }}"
                               alt="User profile picture">
                        </div>

                        <h3 class="profile-username text-center"> {{ auth()->user()->name }}</h3>

                        <p class="text-muted text-center">
                            @if (auth()->user()->type == 'super_admin' || auth()->user()->type == 'admin')
                                @lang('site.admin')
                            @elseif (auth()->user()->type == 'student')
                                @lang('site.student')
                            @elseif (auth()->user()->type == 'doctor')
                                @lang('site.doctor')
                            @endif
                        </p>

                        <ul class="list-group list-group-unbordered mb-3">
                          <li class="list-group-item">
                            <b>@lang('site.subjects')</b> <a class="float-right">  1</a>
                          </li>
                          <li class="list-group-item">
                            <b>@lang('site.lessons')</b> <a class="float-right"> 4</a>
                          </li>
                          <li class="list-group-item">
                            <b>@lang('site.assignments')</b> <a class="float-right"> 4</a>
                          </li>
                        </ul>

                      </div>
                      <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                    <!-- About Me Box -->
                    <div class="box box-primary">
                      <div class="box-header">
                        <h3 class="box-title">@lang('site.about-me')</h3>
                      </div>
                      <!-- /.card-header -->
                      <div class="box-body">
                        <strong><i class="fa fa-book mr-1"></i> @lang('site.name')</strong>

                        <p class="text-muted">
                            {{ auth()->user()->name }}
                        </p>

                        <hr>

                        <strong><i class="fa fa-book mr-1"></i> @lang('site.phone')</strong>

                        <p class="text-muted">{{ auth()->user()->phone }}</p>

                        <hr>

                    </div>
                      <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                  </div>
                  <!-- /.col -->

                </div>
                <!-- /.row -->
              </div><!-- /.container-fluid -->
        </section>
    </div>
@endsection
