@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">

        <section class="content-header">

            <h1>@lang('site.edit_orderRegist')</h1>

            <ol class="breadcrumb">
                <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                <li><a href="{{ route('dashboard.students.index') }}">@lang('site.students')</a></li>
                <li class="active">@lang('site.edit_orderRegist')</li>
            </ol>
        </section>
            <section class="content">

                <div class="row">

                    <div class="col-md-6">

                        <div class="box box-primary">

                            <div class="box-header">

                                <h3 class="box-title" style="margin-bottom: 10px">@lang('site.doctors')</h3>

                            </div><!-- end of box header -->

                            <div class="box-body">

                                @foreach ($doctors as $doctor)

                                    <div class="panel-group">

                                        <div class="panel panel-info">

                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" href="#{{ str_replace(' ', '-', $doctor->name) }}">{{ $doctor->name }}</a>
                                                </h4>
                                            </div>

                                            <div id="{{ str_replace(' ', '-', $doctor->name) }}" class="panel-collapse collapse">

                                                <div class="panel-body">

                                                    @if ($doctor->subjects->count() > 0)

                                                        <table class="table table-hover">
                                                            <tr>
                                                                <th>@lang('site.name')</th>
                                                                <th>@lang('site.stock')</th>
                                                                <th>@lang('site.price')</th>
                                                                <th>@lang('site.add')</th>
                                                            </tr>

                                                            @foreach ($doctor->subjects as $subject)
                                                                <tr>
                                                                    <td>{{ $subject->name }}</td>
                                                                    <td>{{ $subject->stock }}</td>
                                                                    <td>{{ number_format($subject->sale_price,2) }}</td>
                                                                    <td>
                                                                        <a href=""
                                                                        id="subject-{{ $subject->id }}"
                                                                        data-name="{{ $subject->name }}"
                                                                        data-id="{{ $subject->id }}"
                                                                        data-price="{{ $subject->sale_price }}"
                                                                        class="btn {{ in_array($subject->id, $orderRegist->subjects->pluck('id')->toArray()) ? 'btn-default disabled' : 'btn-success add-subject-btn' }} btn-sm">
                                                                        <i class="fa fa-plus"></i>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            @endforeach

                                                        </table><!-- end of table -->

                                                    @else
                                                        <h5>@lang('site.no_records')</h5>
                                                    @endif

                                                </div><!-- end of panel body -->

                                            </div><!-- end of panel collapse -->

                                        </div><!-- end of panel primary -->

                                    </div><!-- end of panel group -->

                                @endforeach

                            </div><!-- end of box body -->

                        </div><!-- end of box -->

                    </div><!-- end of col -->

                    <div class="col-md-6">

                        <div class="box box-primary">

                            <div class="box-header">

                                <h3 class="box-title">@lang('site.ordersRegist')</h3>

                            </div><!-- end of box header -->

                            <div class="box-body">

                                @include('partials._errors')

                                <form action="{{ route('dashboard.students.ordersRegist.update', ['orderRegist' => $orderRegist->id, 'student' => $student->id]) }}" method="post">

                                    {{ csrf_field() }}
                                    {{ method_field('put') }}

                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>@lang('site.subject')</th>
                                            <th>@lang('site.quantity')</th>
                                            <th>@lang('site.price')</th>
                                        </tr>
                                        </thead>

                                        <tbody class="order-list">
                                            @foreach ($orderRegist->subjects as $subject)
                                            <tr>
                                                <td>{{ $subject->name }}</td>
                                                <td><input type="number" name="subjects[{{ $subject->id }}][quantity]" data-price="{{ number_format($subject->sale_price, 2) }}" class="form-control input-sm subject-quantity" min="1" value="{{ $subject->pivot->quantity }}"></td>
                                                <td class="subject-price">{{ number_format($subject->sale_price * $subject->pivot->quantity, 2) }}</td>
                                                <td>
                                                    <button class="btn btn-danger btn-sm remove-subject-btn" data-id="{{ $subject->id }}"><span class="fa fa-trash"></span></button>
                                                </td>
                                            </tr>
                                            @endforeach

                                        </tbody>

                                    </table><!-- end of table -->

                                    <h4>@lang('site.total') : <span class="total-price">{{ number_format($orderRegist->total_price,2)}}</span></h4>

                                    <button class="btn btn-primary btn-block disabled" id="add-orderRegist-form-btn"><i class="fa fa-plus"></i> @lang('site.edit_orderRegist')</button>

                                </form>

                            </div><!-- end of box body -->

                        </div><!-- end of box -->

                        @if ($student->ordersRegist->count() > 0)

                        <div class="box box-primary">

                            <div class="box-header">

                                <h3 class="box-title" style="margin-bottom: 10px">@lang('site.previous_ordersRegist')
                                    <small>{{ $ordersRegist->total() }}</small>
                                </h3>

                            </div><!-- end of box header -->

                            <div class="box-body">

                                @foreach ($ordersRegist as $order)

                                    <div class="panel-group">

                                        <div class="panel panel-success">

                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" href="#{{ $order->created_at->format('d-m-Y-s') }}">{{ $order->created_at->toFormattedDateString() }}</a>
                                                </h4>
                                            </div>

                                            <div id="{{ $order->created_at->format('d-m-Y-s') }}" class="panel-collapse collapse">

                                                <div class="panel-body">

                                                    <ul class="list-group">
                                                        @foreach ($order->subjects as $subject)
                                                            <li class="list-group-item">{{ $subject->name }}</li>
                                                        @endforeach
                                                    </ul>

                                                </div><!-- end of panel body -->

                                            </div><!-- end of panel collapse -->

                                        </div><!-- end of panel primary -->

                                    </div><!-- end of panel group -->

                                @endforeach

                                {{ $ordersRegist->links() }}

                            </div><!-- end of box body -->

                        </div><!-- end of box -->

                    @endif


                    </div><!--end of col-->
                </div><!--end of row-->

            </section>
        </section>


    </div><!--end of wrapper-->

@endsection
