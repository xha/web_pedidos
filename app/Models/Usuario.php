<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Usuario
 * 
 * @property int $idUsuario
 * @property string $usuario
 * @property string $correo
 * @property bool $esPersona
 * @property int $idPersona
 * @property int $idPreguntaSeguridad
 * @property string $respuestaSeguridad
 * @property int $idPerfil
 * @property string|null $clave
 * @property string|null $color
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Perfil $perfil
 * @property PreguntaSeguridad $pregunta_seguridad
 * @property Collection|Carrito[] $carritos
 * @property Collection|Compra[] $compras
 * @property Collection|CuentasPorCobrar[] $cuentas_por_cobrars
 * @property Collection|CuentasPorPagar[] $cuentas_por_pagars
 * @property Collection|Inventario[] $inventarios
 * @property Collection|Venta[] $venta
 *
 * @package App\Models
 */
class Usuario extends Model
{
	protected $table = 'usuario';
	protected $primaryKey = 'idUsuario';
	public $timestamps = false;

	protected $casts = [
		'esPersona' => 'bool',
		'idPersona' => 'int',
		'idPreguntaSeguridad' => 'int',
		'idPerfil' => 'int',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'usuario',
		'correo',
		'esPersona',
		'idPersona',
		'idPreguntaSeguridad',
		'respuestaSeguridad',
		'idPerfil',
		'clave',
		'color',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function perfil()
	{
		return $this->belongsTo(Perfil::class, 'idPerfil');
	}

	public function pregunta_seguridad()
	{
		return $this->belongsTo(PreguntaSeguridad::class, 'idPreguntaSeguridad');
	}

	public function carritos()
	{
		return $this->hasMany(Carrito::class, 'idUsuario');
	}

	public function compras()
	{
		return $this->hasMany(Compra::class, 'idUsuario');
	}

	public function cuentas_por_cobrars()
	{
		return $this->hasMany(CuentasPorCobrar::class, 'idUsuario');
	}

	public function cuentas_por_pagars()
	{
		return $this->hasMany(CuentasPorPagar::class, 'idUsuario');
	}

	public function inventarios()
	{
		return $this->hasMany(Inventario::class, 'idUsuario');
	}

	public function venta()
	{
		return $this->hasMany(Venta::class, 'idUsuario');
	}
}
